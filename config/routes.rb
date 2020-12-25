Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do  
      resources :users
      post '/login' => 'sessions#login'
      get '/home' => 'users#show'
      
      post '/signup' => 'users#create'
      get '/autologin' => 'sessions#autologin'

    end
  end

  namespace :api do
    namespace :v1 do  
      resources :comments 
    end
  end

  namespace :api do
    namespace :v1 do  
     resources :books  do
        resources :comments 
      end
    end
  end

 end
