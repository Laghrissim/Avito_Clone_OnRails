Rails.application.routes.draw do
  devise_for :admins
  get 'admin/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'annonces/index'
  get 'annonces/show'
  get 'annonces/new', as: 'new_annonce'
  get 'annonces/edit'
  get 'annonces/create'
  get 'annonces/update'
  get 'annonces/destroy'
  devise_for :users
  root to: "home#home"
  resources :annonces
  resources :contact, only: [:new, :create]
 
  get '/admin', to: 'admin#index', as: 'admin'
  get '/admin/annonces', to: 'admin#show', as: 'admin_show'




  get '/show/:id', to: 'home#show', as: 'home'
  #  get '/login', to: 'login#login'
  #  post '/signup', to: 'users#new'
  #  post '/signup', to: 'users#create'


end
# new_annonce_path