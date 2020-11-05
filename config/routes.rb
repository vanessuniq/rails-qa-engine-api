Rails.application.routes.draw do
  root to: "static#home"
  resources :questions, except: [:new, :show, :edit, :update]
  resources :answers, except: [:new, :edit, :show]
  resources :users, only: [:create]
  post '/login', to: "auth#login"
  get '/profile', to: "users#profile"
end
