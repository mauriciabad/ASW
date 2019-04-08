Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :issues
  resources :users
  resources :comments
  resources :open_issues
  resources :my_issues
  resources :lines
  
  #Si esta registrat un Usuari
  if true
    root to: "home#show"
  else
    root to: "issues#index"
  end
end