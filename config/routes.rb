# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, except: []

  get '/sign_up', to: 'users#sign_up'
  post '/sign_up/account_verify', to: 'users#account_verify'

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in/check', to: 'users#check'

  delete '/sign_out', to: 'users#sign_out'
end
