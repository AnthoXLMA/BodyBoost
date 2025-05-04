Rails.application.routes.draw do
  get 'meal_items/create'
  get 'dashboard/show'
  get 'meals/index'
  get 'meals/new'
  get 'meals/create'
  get 'meals/edit'
  get 'meals/update'
  get 'meals/destroy'
  get 'activities/index'
  get 'activities/new'
  get 'activities/create'
  get 'activities/edit'
  get 'activities/update'
  get 'activities/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "sessions#new"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "dashboard#show"

  resources :activities
  resources :meals
  resources :foods, only: [:index]
  resources :meal_items, only: [:create]
  resource :profile, only: [:edit, :update], controller: 'users'

end

