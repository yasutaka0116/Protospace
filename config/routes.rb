
Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get  '/prototypes/index'  =>    'prototypes#index'
  get  '/prototypes/new'    =>    'prototypes#new'
  get  '/prototypes/:id'   =>    'prototypes#show'
  post  '/prototypes'       =>    'prototypes#create'
  get  '/prototypes/:id/edit'  => 'prototypes#edit'
  delete  '/prototypes/:id'  =>'prototypes#delete'
  resources :users, only: [:show, :edit, :update]
end
