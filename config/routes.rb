Rails.application.routes.draw do
 
  root 'static_pages#home'

  match '/home',  to: 'static_pages#home',  via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/help',  to: 'static_pages#help',  via: 'get'
end
