Rails.application.routes.draw do
  
  resources :users
  resources :issues
  root 'issues#index'
  
end
