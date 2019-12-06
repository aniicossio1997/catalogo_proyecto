Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root 'frontend/main#index'
  end

  authenticated do
    root 'backend/main#index'
=======
  devise_for :users, controllers: { registrations: 'users/registrations' }
  scope module: :frontend do
    root to: 'main#home'
    resources :products, only: %i[index show]
    resources :buys, only: [:index, :show] do
      get 'create', to: 'buys#create', on: :collection, as: :create
    end
    get 'cart', to: 'cart#show'
    get 'add_product_to_cart/:id', to: 'cart#add_to_cart', as: 'add_product_to_cart'
    get 'remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_product_from_cart'
>>>>>>> Stashed changes
  end

  namespace :backend do
    resources :users
    resources :categories
    resources :tags
    resources :sliders
    resources :products
<<<<<<< Updated upstream
=======
    resources :clients, only: %i[index destroy]
    resources :configs, except: %i[show destroy index edit] do
      get 'edit', on: :collection
    end

    resources :buys, only: %i[index show] do
      member do
        put :state_change_accepted
        put :state_change_rejected
      end
      # get ':id/:context/state_change_accepted', to: 'buys#state_change_accepted' , as: 'state_change_accepted'
      # get ':id/:context/state_change_rejected', to: 'buys#state_change_rejected' , as: 'state_change_rejected'
    end
>>>>>>> Stashed changes
  end

end
