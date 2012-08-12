EventBase::Application.routes.draw do

  resources :users

  resources :venues

  resources :companies

  resources :people

  resources :events

  root :to => 'pages#home'
  
  post '/search' => 'pages#search'

end
