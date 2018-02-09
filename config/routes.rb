Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root
  root to: 'static#home'
  resources :users, :exercises, :workout_exercises, :workouts


end
