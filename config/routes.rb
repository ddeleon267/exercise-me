Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root
  root to: 'static#index'

  resources :users do
    resources :workouts, only: [:index, :show]
  end

  resources :exercises, :workout_exercises, :workouts #prolly don't need all this
  #took out users

  get "/signin", to: "sessions#new"
  get "/signup", to: "users#new"

  get "/home", to: "users#home"

  #login route
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  #want to name users new differently
  ##need sessions controller or nah?
end
