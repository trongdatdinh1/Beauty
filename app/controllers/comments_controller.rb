class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.create! comment_params
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :post_id, :user_id, :content
  end
end
