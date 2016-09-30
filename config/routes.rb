
Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/newest'  => 'prototypes/newest#index'
  get 'prototypes/popular'  => 'prototypes/popular#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
