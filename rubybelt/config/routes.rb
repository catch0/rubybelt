Rails.application.routes.draw do
  
   root 'users#index'
   post '/users' => "users#create"
   get 'users/:id' => "users#show"
    
   get '/ideas' => "ideas#index"
   post '/ideas' => "ideas#create"
   get '/ideas/:id/destroy' => "ideas#destroy" 
   get '/ideas/:id' => "ideas#show"
    
   get '/likes/:id' => "likes#create"
    
   post '/sessions' => "sessions#create"
   delete '/sessions' => "sessions#destroy"
end
