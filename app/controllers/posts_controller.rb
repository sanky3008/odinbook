class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    following_ids = current_user.following.pluck(:following_user_id)
    @posts = Post.where(author_id: following_ids).order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end
end
