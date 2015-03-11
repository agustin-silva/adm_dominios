Rails.application.routes.draw do
  root :to => 'sesiones#new'
  resources :sesiones
  resources :usuarios
  resources :dominios

  get 'login' => 'sesiones#new', :as => :login
  post 'logout' => 'sesiones#destroy', :as => :logout
end
