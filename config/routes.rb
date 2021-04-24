Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :categories
  resources :products
  resource :cart, only:[:show, :update, :destroy]

  # devise_for :admins 
  devise_for :users

  resource :cart, only: [:show, :update]

  
  authenticate :user do

  end

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
