Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show", as: :page
end
