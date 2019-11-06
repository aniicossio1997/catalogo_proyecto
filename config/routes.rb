Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root 'frontend/main#index'
  end

  authenticated do
    root 'backend/main#index'
  end

  namespace :backend do
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
  end

end
