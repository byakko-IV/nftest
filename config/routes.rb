Rails.application.routes.draw do
  root 'bills#index'
  resources :bills
end
