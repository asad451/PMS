Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  namespace :admin do
    resources :clients
    resources :projects
    resources :users do
      member do
        get 'change_status'
        get 'change_role'
      end
    end
    root to: 'dashboard#index'
  end
end
