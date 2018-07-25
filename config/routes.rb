Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  scope '/admin' do
    resources :clients
    resources :projects
  end
  
  namespace :admin do
    resources :admins do
      member do
        get 'change_status'
        get 'change_role'
      end
    end    
    root to: 'admins#index'
  end
end
