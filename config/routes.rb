Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  root 'bills#index'
  resources :bills do
    resources :payments, only: [:create, :new]
  end
end
