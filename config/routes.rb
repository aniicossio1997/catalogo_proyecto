Rails.application.routes.draw do
  devise_for :users
  root to: 'frontend/main#home'

  scope module: :frontend do
    resources :products, only: [:index, :show ]
  end

  namespace :backend do
    root 'main#index'
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
    resources :configs, except: [:show, :destroy, :index,:edit] do
      get 'edit', on: :collection
    end
  end
end
