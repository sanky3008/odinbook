class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def follow
    @user_to_follow = User.find(params[:id])
    current_user.following << @user_to_follow unless current_user.following.include?(@user_to_follow)
    redirect_to user_path(@user_to_follow), notice: "You are now following #{@user_to_follow.email}."
  end

  def unfollow
    @user_to_unfollow = User.find(params[:id])
    current_user.following.delete(@user_to_unfollow)
    redirect_to user_path(@user_to_unfollow), notice: "You have unfollowed #{@user_to_unfollow.email}."
  end
end
