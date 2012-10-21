EventBase::Application.routes.draw do

  resources :filters

  resources :lists

  resources :users

  resources :venues

  resources :companies
  get '/companies_scroll' => 'companies#scroll', as: :companies_scroll

  resources :people

  resources :events

  root :to => 'pages#home'
  
  post '/search' => 'pages#search'
  
  get '/dashboard' => 'pages#dashboard', as: :dashboard
  
  post '/sessions' => 'sessions#create', as: :sessions
  delete '/sessions' => 'sessions#destroy'
  
  post '/trackers' => 'trackers#create', as: :trackers
  delete '/trackers' => 'trackers#destroy'
  
  delete '/remove_filters/:type' => 'filters#remove', as: :remove_all_filters_of_type
  delete '/remove_all_filters' => 'filters#remove_all', as: :remove_all_filters
end
