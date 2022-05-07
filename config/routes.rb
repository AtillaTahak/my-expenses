# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  unauthenticated :user do
    root to: "home#index", as: "home"
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'group#index'
  resources :users do
    resources :group do
      resources :entity
    end
  end
end
