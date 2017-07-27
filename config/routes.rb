Rails.application.routes.draw do

  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks",  :sessions => "users/sessions"}


  root 'landing#index', as: 'landing_index'

  resources :bundled_items, only: [:show, :index]
  resources :line_items, only: [:create]
  resources :carts, only: [:update, :destroy] do
    member do
      get :checkout
    end
  end

  resources :items, only: [:show, :index] do
    collection do
      get :category
      get :search
      get :autocomplete
    end
    resources :photos, only: [:index, :show]
    resources :reviews, only: [:create, :update, :edit, :destroy]
    resources :videos, only: [:index]
  end

  namespace :dashboard do
    root 'items#index'
    devise_for :admins, path: '', path_names: {sign_in: 'login', sign_out: 'logout'},
                controllers: {
                  :sessions => "dashboard/sessions",
                }

  	resources :items do
  		collection do
    		get :category
  		end
      resources :photos, only: [:index, :show, :new, :create, :destroy]
      resources :reviews, only: [:destroy]
      resources :videos, only: [:index, :new, :create, :destroy]
    end
    resources :orders do
      member do
        get :fulfill
        get :unfulfill
      end
    end
    resources :bundled_items
  end

end
