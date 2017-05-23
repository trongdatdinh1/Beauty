class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    if valid_page?
      @posts = Post.all.order_by_created
      render "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root +
      "app/views/pages/#{params[:page]}.html.erb"))
  end
end
