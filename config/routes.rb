Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  
  namespace :admin do
    root to: 'admins#index'
    resources :users
  end
  
end
