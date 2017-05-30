class ReviewsController < ApplicationController
  load_resource :user
  load_and_authorize_resource

  def new
    @review = Review.new
  end

  def create
    if @review.save
      flash[:success] = t "rated"
      redirect_to user_path @review.reviewed
    else
      flash[:danger] = t "unselected"
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      redirect_to user_path @review.reviewed
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path @review.reviewed
  end

  private
  def review_params
    params.require(:review).permit(:star, :content, :user_id, :reviewed_id)
  end
end
