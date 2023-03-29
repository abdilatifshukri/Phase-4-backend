Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show, :create, :destroy]
  resources :actors, only: [:index, :show, :create]
  resources :directors, only: [:index, :show, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
