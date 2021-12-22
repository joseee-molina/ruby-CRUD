Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  
  resources :articles, :users#, only: [:show, :index, :new, :create, :edit, :update]
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
  
  
end
