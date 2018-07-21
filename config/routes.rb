Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  scope '/admin' do
    resources :clients
  end
  
  namespace :admin do
    resources :admins do
      member do
        get 'user_status'
      end
    end    
    root to: 'admins#index'
  end
end
