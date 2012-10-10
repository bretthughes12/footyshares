Footyshares::Application.routes.draw do

  match '/login' => "sessions#new", as: :login
  match '/logout' => "sessions#destroy", as: :logout
  match '/signup' => 'signups#new', as: :signup
  match '/admin' => "static#admin", as: :admin
  match '/shares/invest' => "shares#invest", as: :invest_shares
  match '/shares/update_multiple' => "shares#update_multiple", as: :update_multiple_shares

  resource :sessions, only: [:new, :create, :destroy]
  resource :signups, only: :create
  resources :users, except: [:new, :create]

  namespace :admin do
    resources :rounds do
      collection do
        post :update_shares
      end
    end

    resources :users
    resources :matches
    resources :teams
    resources :shares
  end

  root to: 'users#index'
end
