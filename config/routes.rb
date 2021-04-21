Rails.application.routes.draw do

  resource :cart, only:[:show, :update, :destroy]
  resources :products
  devise_for :admins 
  root to: 'home#index'
  devise_for :users
  


  authenticate :admin do
    resources :categories
  end

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
