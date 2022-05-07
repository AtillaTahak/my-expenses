Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  unauthenticated do
    root to: 'home#index'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root "entity#index", as: "Transactions"
  resources :entity
  resources :group
end
