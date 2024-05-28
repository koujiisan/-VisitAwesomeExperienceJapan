Rails.application.routes.draw do
  root 'top#index'
  resources :users
  resources :experiences
  resources :profiles, only: %i[new create edit update]
  resources :experiences do
    resources :comments, only: [:create]
  end
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
end
