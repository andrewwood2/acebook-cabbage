class PostsController < ApplicationController
  before_action :find_post, only: [:update, :edit, :show, :destroy]

  def new
    return redirect_to root_path unless user_signed_in?
    @post = Post.new
  end

  def create
    # binding.irb
# "User.first" is a workaround for 'current_user' (var generated from Devise params). When current_user is sorted, can put this back in.
    # @post = current_user.posts.create!(post_params)
    @post = User.first.posts.create!(post_params)
    render "show"
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    end
  end

  def edit
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show

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
