Rails.application.routes.draw do
  resources :games
  resources :comments
  resources :reviews
  devise_for :users
  root 'games#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
