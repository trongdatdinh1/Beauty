class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  load_and_authorize_resource

  def index
    @user = User.find_by id: current_user.id
    @posts = @user.posts.order_by_created
  end

  def new
  end

  def create
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      redirect_to post_path @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit :title, :content, :post_img
  end
end
