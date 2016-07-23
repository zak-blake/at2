Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :pieces
  resources :albums
  root 'pages#home'

  # using a controller to server static pages
  controller :pages do
    get :home
    get :about
  end

end
