
Rails.application.routes.draw do

  root 'sessions#login'

  get '/login', to: 'sessions#login', as: 'login'
  get '/signup', to: 'sessions#signup', as: 'signup'
  post '/login', to: 'sessions#attempt_login'
  post '/signup', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  get '/search', to: 'foods#search', as: 'food_search'
  get '/search', to: 'foods#search_form', as: 'search_form'

  resources :users

  resources :foods do
    resources :restaurants
  end

end
