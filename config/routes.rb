Rails.application.routes.draw do
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/dashboard', to: 'dashboard#index'
  root 'sessions#new'
end