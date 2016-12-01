Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :items, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update] do
  	resources :bookings, only: [:edit, :update]
  end

  resource :dashboard, only: [:show] do
  	resources :items, only: [:edit, :update]
  end

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
end
