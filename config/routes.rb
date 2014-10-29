Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/beers' => 'beers#index'

  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  match '/signout',   to: 'sessions#destroy',       via: 'delete'
  match '/home',      to: 'static_pages#home',      via: 'get'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/help',      to: 'static_pages#help',      via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
end
