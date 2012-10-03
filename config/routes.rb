Footyshares::Application.routes.draw do

  match '/login' => "sessions#new", as: :login
  match '/logout' => "sessions#destroy", as: :logout
  match '/signup' => 'signups#new', as: :signup

  match '/admin' => "static#admin", as: :admin

  resource :sessions, only: [:new, :create, :destroy]
  resource :signups, only: :create

  resources :shares do
    collection do
      get :invest
      put :update_multiple
    end
  end
  resources :users 
  resources :rounds do
    collection do
      post :update_shares
    end
  end
  resources :matches
  resources :teams

  namespace :admin do
    resources :users do
      member do
        put :paid
      end
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root to: 'users#index'
end
