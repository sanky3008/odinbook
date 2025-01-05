class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    following_ids = current_user.following.pluck(:following_user_id)
    @posts = Post.where(author_id: following_ids).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def like
    @post = Post.find(params[:id])
    @post.increment!(:likes)
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
