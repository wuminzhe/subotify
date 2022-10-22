# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  resources :users
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root :to => 'users#index'
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
