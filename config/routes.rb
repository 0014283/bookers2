Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :top, only: [:index]
  get 'top/about'
end
