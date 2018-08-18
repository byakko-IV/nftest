Rails.application.routes.draw do
  require 'sidekiq/web'
  mount ActionCable.server, at: '/cable'
  mount Sidekiq::Web => '/sidekiq'

  root 'bills#index'
  resources :bills do
    resources :payments, only: [:create, :new]
  end

  namespace :api do
    namespace :v1 do
      resources :bills, only: [] do
        resources :payments, only: [:create]
      end
    end
  end
end
