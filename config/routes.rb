EventBase::Application.routes.draw do

  resources :users

  resources :venues

  resources :companies

  resources :people

  resources :events

  root :to => 'pages#home'
  
  post '/search' => 'pages#search'
  
  get '/dashboard' => 'pages#dashboard', as: :dashboard
  
  post '/sessions' => 'sessions#create', as: :sessions
  delete '/sessions' => 'sessions#destroy'
  
  post '/trackers' => 'trackers#create', as: :trackers
  delete '/trackers' => 'trackers#destroy'
end
