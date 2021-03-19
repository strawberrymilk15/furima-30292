Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "items#index"
  resources :cards, only: [:new, :create]
  resources :items do
    resources :orders, only: [:index,:create]
  end
  resources :portfolios, only: [:index]
  resources :abouts, only: [:index]
  resources :contacts, only: [:index,:new,:create,:destroy,:show]
  resources :destroy_contacts, only: [:index]
  resources :create_contacts, only: [:index]
end
