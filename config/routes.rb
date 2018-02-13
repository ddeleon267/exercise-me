Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root
  root to: 'static#index'
  resources :users, :exercises, :workout_exercises, :workouts

  get "/signin", to: "sessions#new"
  get "/signup", to: "users#new"

  get "/home", to: "users#home"

  #login route
  post "/signin", to: "sessions#create"

  post "/signout", to: "sessions#destroy"

  #want to name users new differently
  ##need sessions controller or nah?
end
