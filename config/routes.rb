# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Rails.application.routes.draw do
  #   # get '/items', to: 'items#index'
  #   # post '/items', to: 'items#create'
  #   resources :items
  #
  # end
  get '/admin/users_count', to: 'admin#users_count'

  resources :items do
    get 'upvote', on: :member
    get 'downvote', on: :member
    get 'expensive', on: :collection
  end

  root to: 'items#index'


end
