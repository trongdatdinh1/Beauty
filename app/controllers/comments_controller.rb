class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    respond_to do |format|
      if @comment.save
        NotificationServices::CreateNotification.new(comment: @comment,
          current_user_id: current_user.id).create_notification
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
