Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :actors, only: [:create, :index, :show, :update, :destroy]
    resources :diractors, only: [:create, :index, :show, :update, :destroy]
    resources :reviews, only: [:create, :index, :show, :update, :destroy]
  end
  resources :users, only: [:create, :index, :show, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
