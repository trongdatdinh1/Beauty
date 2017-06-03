class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  load_and_authorize_resource

  def show
    @supports = Supports::User.new @user
  end
end
