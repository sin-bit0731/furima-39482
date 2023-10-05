Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items,:items
  resources :users, only: [:show]
end
