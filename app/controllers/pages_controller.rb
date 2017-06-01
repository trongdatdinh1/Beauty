class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    if valid_page?
      @posts =
        if params[:tag]
          Post.all.tagged_with(params[:tag])
            .order_by_created.page(params[:page]).per(20)
        else
          Post.all.order_by_created.page(params[:page]).per(20)
        end
      render "pages/#{params[:static]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root +
      "app/views/pages/#{params[:static]}.html.erb"))
  end
end
