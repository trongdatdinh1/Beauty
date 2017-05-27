Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users_devise/registrations"}

  resources :users, only: [:show]

  root "pages#show", page: "home"
  get "/pages/*page" => "pages#show", as: :page

  resources :posts do
    resources :votes, only: [:create, :destroy]
  end

  get "tags/:tag", to: "posts#index", as: :tag
end
