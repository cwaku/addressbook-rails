# frozen_string_literal: true

Rails.application.routes.draw do
  resources :permissions_roles
  resources :permissions
  resources :user_roles
  resources :roles
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contacts#index"
end
