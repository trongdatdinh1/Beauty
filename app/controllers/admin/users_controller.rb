class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.page params[:page]
    @supports = Supports::User.new @user
  end

  def destroy
    @user.destroy
    flash[:success] = t "admin.users.destroy.user_deleted"
    redirect_to admin_users_path
  end
end
