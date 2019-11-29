Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  scope module: :frontend do
    root to: 'main#home'
    resources :products, only: [:index, :show ]
    resources :buys, only: [:index, :show]

  end

  namespace :backend do
    root 'main#index'
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
    resources :clients, only: [:index, :destroy, :show]
    resources :configs, except: [:show, :destroy, :index,:edit] do
      get 'edit', on: :collection
    end
    resources :buys, only: [:index] do
      get 'change_state_accept'
    end
  end
end
