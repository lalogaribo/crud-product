Rails.application.routes.draw do
  resources :products
  devise_for :users
  get 'pages/home'

  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
