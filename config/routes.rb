Rails.application.routes.draw do
  # get 'homes/home'
  get 'home/about' => 'homes#about'
 devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  resources :users, :only => [:show, :index, :edit, :update]
  resources :books
  # root 'users#index'
  root to: 'homes#home'

end
