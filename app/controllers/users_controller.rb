class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "some_thing_went_wrong"
      redirect_to root_path
    end
  end
end
