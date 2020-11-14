Rails.application.routes.draw do
  resources :games
  resources :comments
  resources :reviews
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'reviews#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
