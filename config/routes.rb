# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  scope module: :frontend do
    root to: 'main#home'
    resources :products, only: %i[index show]
    resources :buys, only: %i[index show]
    get 'cart', to: 'cart#show'
  end

  namespace :backend do
    root 'main#index'
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
    resources :clients, only: %i[index destroy show]
    resources :configs, except: %i[show destroy index edit] do
      get 'edit', on: :collection
    end
    resources :buys, only: %i[index show] do
      # get 'buys/:id/state_change_accepted', to: 'buys#state_change_accepted' , as: 'buy/change_accepted'
      member do
        get :state_change_accepted
        get :state_change_rejected
      end
    end
  end
end
