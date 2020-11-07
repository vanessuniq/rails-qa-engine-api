Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions, except: [:new, :show, :edit, :update]
      resources :answers, except: [:new, :edit, :show]
      resources :votes, only: [:create, :destroy]
      resources :users, only: [:create] #handle signup
      post '/login', to: "auth#login" #handles login for existing users
      get '/auto_login', to: 'auth#auto_login' #handles auto login upon successful signup/login
      
    end
  end
  root to: "static#home"
  
end
