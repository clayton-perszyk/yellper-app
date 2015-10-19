Rails.application.routes.draw do
  root 'sessions#login'

  get '/login', to: 'sessions#login', as: 'login'
  get '/signup', to: 'sessions#signup', as: 'signup'
  post '/login', to: 'sessions#attempt_login'
  post '/signup', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  resources :users
  resources :foods
end

