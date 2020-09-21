Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/', to: 'sessions#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  get 'authorized', to: 'sessions#page_requires_login'
  
end
