Rails.application.routes.draw do

  namespace 'api' do 
    namespace 'v1' do
      resources :users, only: %i[ show create update destroy ]
      resources :favorites, only: %i[ show create ]
    end
  end

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
