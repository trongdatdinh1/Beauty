class Admin::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @supports = Supports::Post.new @post, @posts
    @posts = @posts.page params[:page]
  end

  def destroy
    @post.destroy
    flash[:success] = t "admin.posts.delete.post_deleted"
    redirect_to admin_posts_path
  end
end
