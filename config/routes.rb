Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :balances, only: [ :index, :new, :show, :create, :edit, :update]
  resources :collections do 
    resources :items , only: [ :new, :create] do
      resources :transactions, only: [ :new, :create]
    end
  end
  resources :items, only: [:show, :destroy, :edit, :update]
end

