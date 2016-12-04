Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :meters
  resources :gpios
  resources :sensors
  resources :setpoints
  resources :users
  resources :logs

  get 'charts', to: 'charts#index'


  post 'authenticate', to: 'authentication#authenticate'
  root to: 'charts#index'

end
