class ReportsController < ApplicationController
  def create
    @post = Post.find_by id: params[:post_id]
    @post.downvote_from current_user, vote_scope: "report"
    respond_to do |format|
      format.html{redirect_to @post}
      format.js{render :report}
    end
  end
end
