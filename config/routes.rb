Rails.application.routes.draw do

  get '/login' => "sessions#new", as: :login
  get '/logout' => "sessions#destroy", as: :logout
  get '/signup' => 'signups#new', as: :signup
  get '/admin' => "static#admin", as: :admin
  get '/shares/invest' => "shares#invest", as: :invest_shares
  get '/shares/update_multiple' => "shares#update_multiple", as: :update_multiple_shares

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
