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
    resources :clients, only: [:index, :destroy]
    resources :configs, except: [:show, :destroy, :index,:edit] do
      get 'edit', on: :collection
    end
    resources :buys, only: [:index,:show] do
    #get 'buys/:id/state_change_accepted', to: 'buys#state_change_accepted' , as: 'buy/change_accepted'
      member do
        get :state_change_accepted
        get :state_change_rejected
      end
    end
  end
end
