Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #url is entered => request is sent to server => !!! router interprets request  !!! =>
  #sends msg to controller mapped to that route

  root "static#index"

  resources :users do
    resources :workouts, only: [:index, :show, :new, :edit, :destroy]
  end

  resources :exercises, :workouts

  get "/signup", to: "users#new"
  get "/home", to: "users#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/auth/twitter/callback' => 'sessions#omnicreate'
end
