Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root
  root to: 'static#index'

  resources :users do
    resources :workouts, only: [:index, :show, :new, :edit, :destroy]
  end

  resources :exercises, :workout_exercises, :workouts #prolly don't need all this
  #took out users

  get "/login", to: "sessions#new"
  get "/signup", to: "users#new"

  get "/home", to: "users#home"

  #login route
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#omnicreate'
end
