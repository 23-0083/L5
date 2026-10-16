Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:index, :new, :create, :destroy]
  resources :likes, only: [:create, :destroy]

  get "top/main", to: "top#main"
  get "top/login_form", to: "top#login_form"
  post "top/login", to: "top#login"
  get "top/logout", to: "top#logout"

  root "tweets#index"
end