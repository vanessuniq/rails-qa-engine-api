Rails.application.routes.draw do
  root to: "static#home"
  resources :questions, except: [:new, :show, :edit, :update]
  resources :answers, except: [:new, :edit, :show]
  resources :users, only: [:create] #handle signup
  post '/login', to: "auth#login" #handles login for existing users
  get '/auto_login', to: 'auth#auto_login' #handles auto login upon successful signup/login
  get '/user_is_authed', to: 'auth#user_is_authed' #only accessible to authorized users
end
