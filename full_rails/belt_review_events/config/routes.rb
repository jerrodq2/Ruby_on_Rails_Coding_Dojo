Rails.application.routes.draw do
  resources :users, only:[:new, :update, :create, :show]
  resources :sessions, only: [:new, :destroy, :create]
  resources :events, except: [:index]
  resources :comments, only: [:create]
  resources :rosters, only: [:create, :destroy]
  root 'sessions#new'
  get '/events' => 'events#index'



end
