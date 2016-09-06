Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show, :new]
  resources :pieces
  resources :albums
  resources :messages
  root 'pages#home'

  post 'create_user' => 'users#create', as: :create_user

  # using a controller to server static pages
  controller :pages do
    get :home
    get :about
  end

end
