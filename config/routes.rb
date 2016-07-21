Rails.application.routes.draw do
  devise_for :users
  resources :pieces
  root 'pieces#index'
end
