Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

    get '/books', to: "books#index"
    get '/books/:id', to: "books#show"
    
end
