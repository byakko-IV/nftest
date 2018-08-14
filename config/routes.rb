Rails.application.routes.draw do
  root 'bills#index'
  resources :bills do
    resources :payments, only: [:create, :new]
  end
end
