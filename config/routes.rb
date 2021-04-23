Rails.application.routes.draw do
  root to: 'home#index'

  resources :categories
  resources :products

  devise_for :admins 
  devise_for :users
  

  
  authenticate :user do
  resource :cart, only:[:show, :update, :destroy]
  end

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
