Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index]
  resources :sessions, only: [:new, :destroy, :create]
  root 'sessions#new'
  get '/main' => 'session#new'
  get '/professional_profile' => 'networks#index'
  get '/create/:id' => 'networks#create'
  delete '/destroy/:id' => 'networks#destroy'
  get '/invite/:id' => 'networks#invite'


end
