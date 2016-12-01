Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :meters
  resources :gpios
  resources :items
  resources :sensors
  resources :setpoints
  resources :users
  resources :logs

  get 'chart', to: 'chart#index'


  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

end
