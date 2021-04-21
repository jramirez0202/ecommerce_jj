Rails.application.routes.draw do

  devise_for :admins 
  root to: 'home#index'
  devise_for :users
  


  authenticate :admin do
    resources :categories
  end

  
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
