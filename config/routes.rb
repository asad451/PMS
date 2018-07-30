Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  get 'project/:id', to: 'home#show', as: :project

  namespace :admin do
    resources :clients
    resources :projects do
      resources :payments, only: [:new, :create, :destroy]
    end
    resources :payments, only: [:edit, :update]
    resources :users do
      member do
        get 'change_status'
        get 'change_role'
      end
    end
    root to: 'dashboard#index'
  end
end
