Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :consultations, only:[:new,:create, :index, :show]
  resources :contactos, only:[:new, :create]
  resources :suscriptions, only: [:index, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
