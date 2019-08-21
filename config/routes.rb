Rails.application.routes.draw do
  resources :selections, only: [:index, :show, :new, :create]
  resources :users
  resources :restaurants, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
end
