Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :shoes, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :destroy, :create]
  root 'sessions#new'
  get '/main' => 'sessions#new'
  get '/dashboard/:id' => 'users#show'
  get '/new/purchase/:id/:uid' => 'shoes#purchase'



end
