class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  load_and_authorize_resource

  def index
    @posts =
      if user_signed_in? && params[:tag].nil?
        current_user.posts.order_by_created
      else
        Post.all.tagged_with(params[:tag]).order_by_created
      end
  end

  def new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    impressionist @post
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
    params.require(:post).permit :title, :content, :post_img, :tag_list
  end
end
