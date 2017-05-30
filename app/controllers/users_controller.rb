class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find_by id: params[:id]
    @reviews = Review.where reviewed_id: @user.id
    unless @user
      flash[:danger] = t "some_thing_went_wrong"
      redirect_to root_path
    end
    if @reviews.blank?
      @average_review = 0
    else
      @average_review = @reviews.average(:star).round(2)
    end
  end
end
