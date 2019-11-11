Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
      get 'login', to: 'devise/sessions#new'
      get 'logout', to: 'devise/sessions#destroy'
      root 'devise/sessions#new'
    end
  end
  authenticated do
    root 'backend/main#index'
  end
  scope module: :frontend do
    get 'home', to: 'main#home'
    resources :products, only: [:index, :show ] 
  end


  namespace :backend do
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
  end


end
