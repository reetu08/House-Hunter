Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :users
  post '/users/manual', to: 'users#manual_create'
end
