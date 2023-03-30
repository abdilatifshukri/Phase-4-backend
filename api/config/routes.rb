Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show, :create, :destroy]
  resources :actors, only: [:index, :show, :create]
  resources :directors, only: [:index, :show, :create]
  # Defines the root path route ("/")

    # user
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'
  get '/user/login/check', to: 'users#check_login_status'

       # verify auth
  get '/verify', to: 'application#verify_auth'


  # root "articles#index"
end
