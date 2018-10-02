class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    @user = User.find(params[:friend_id])

    @friendship.save
    redirect_to user_path(@user)
    flash[:notice] = "Added friend."
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to request.referer
    flash[:notice] = "Unfriended."
  end
end
