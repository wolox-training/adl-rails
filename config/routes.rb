Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :books, only: [:index,:show]
    get '/books/open_library/:id', to: 'books#open_library'

    resources :users do
      resources :rents, only: [:index, :create]
    end
    resources :book_suggestions, only: [:create]
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
