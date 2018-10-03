class PostsController < ApplicationController
  # respond_to :json
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_post, only: [:update, :edit, :show, :destroy]

  def new
    return redirect_to root_path unless user_signed_in?
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    render json: @post
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    end
  end

  def edit
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    render json: @posts
  end

  def show
    Comment.create
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def add_like
    find_post
    @post.upvote_by current_user
    redirect_to request.referer
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
