class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @user = current_user
  end

  def new
    @user = current_user
    if @user && @user.admin
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @user = current_user

  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @user = current_user
    if @user.admin
      @post.destroy
      redirect_to posts_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :title, :video_id, :category)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
