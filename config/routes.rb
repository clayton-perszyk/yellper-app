
Rails.application.routes.draw do

  root 'sessions#login'

  get '/login', to: 'sessions#login', as: 'login'
  get '/signup', to: 'sessions#signup', as: 'signup'
  post '/login', to: 'sessions#attempt_login'
  post '/signup', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'



  get '/search', to: 'foods#search', as: 'food_search'
  get '/search', to: 'foods#search_form', as: 'search_form'
  # random food search link
  get 'random_search', to: 'foods#random', as: 'random'
  resources :users
  resources :resets, only: [:new, :edit, :create, :update]

  resources :foods do
    get :autocomplete_search_query, :on => :collection
    resources :restaurants
  end

  resources :foods do
    resources :comments, shallow: true
  end
end
