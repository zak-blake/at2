Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :pieces
  root 'pieces#index'
end
