Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :meters
  resources :gpios
  resources :sensors
  resources :setpoints
  resources :users
  resources :logs

  get 'charts', to: 'charts#index'
  # get '12hr', to: 'charts#12hr'
  # get '6hr', to: 'charts#6hr'
  # get '3hr', to: 'charts#3hr'
  # get '1hr', to: 'charts#1hr'

  get 'sensor_2a', to: 'logs#sensor_2a'
  get 'sensor_2b', to: 'logs#sensor_2b'

  post 'authenticate', to: 'authentication#authenticate'
  root to: 'charts#index'


end
