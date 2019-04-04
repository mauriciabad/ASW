Rails.application.routes.draw do
  
  resources :comments
  resources :users
  resources :issues
  root 'issues#index'
  
end
