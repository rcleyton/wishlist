Rails.application.routes.draw do
  resources :users, only: %i[ show create update destroy ]
  resources :favorites, only: %i[ show create ]
  
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
