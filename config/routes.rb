Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :consultations, only:[:new,:create, :index, :show]
  resources :contactos, only:[:new, :create]

end
