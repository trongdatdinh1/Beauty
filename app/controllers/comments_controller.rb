class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
    else
      @comment = Comment.new comment_params
    end

    if @comment.save
      NotificationServices::CreateNotification.new(comment: @comment,
        current_user_id: current_user.id).create_notification
      respond_to do |format|
        format.html{redirect_to :back}
        format.js
      end
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
