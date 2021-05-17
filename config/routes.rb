Rails.application.routes.draw do
  
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :categories
  resources :order_items
  resources :order

  # delete 'orders/destroy/:id', to: 'orders#destroy', as: 'destroy_order'
  resources :products do
    resources :scores, except: [:show, :index]
  end
  
  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end

  # post 'home/search' , as: 'home_search'
  # devise_for :admins 
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # resources :carts

  # delete 'admin/categories/:id', to: 'admin/categories#destroy', as: 'destroy_categorty'
  authenticate :user do
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  # get '/auth/provider/callback', to: 'sessions#omniauth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
