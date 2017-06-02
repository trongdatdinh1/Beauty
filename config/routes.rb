Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users_devise/registrations"}

  resources :users, only: [:show] do
    resources :reviews, except: [:index, :show]
  end

  root "pages#show", static: "home"
  get "/pages/*static" => "pages#show", as: :page

  resources :posts do
    resources :votes, only: [:create, :destroy]
  end

  get "tags/:tag", to: "posts#index", as: :tag

  resources :comments, only: [:create, :destroy]

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
  end

  resources :notifications, only: [:index, :show]
end
