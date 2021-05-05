Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :categories

  resources :products do
    resources :scores, except: [:show, :index]
  end
  
  resource :cart, only: [:show, :update, :destroy] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end

  # devise_for :admins 
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resource :cart, only: [:show, :update, :destroy]

  # delete 'admin/categories/:id', to: 'admin/categories#destroy', as: 'destroy_categorty'
  authenticate :user do
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
