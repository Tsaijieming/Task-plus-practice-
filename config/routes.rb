Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, except: []

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do 
    resources :users
  end

end
