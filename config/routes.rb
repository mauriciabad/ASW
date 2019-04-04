Rails.application.routes.draw do
<<<<<<< HEAD
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
=======
  
  resources :comments
  resources :users
>>>>>>> refs/remotes/origin/master
  resources :issues
  resources :users
  
  #Si esta registrat un Usuari
  if true
    root to: "home#show"
  else
    root to: "issues#index"
  end
end