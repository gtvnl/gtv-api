Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :meters
  resources :gpios
  resources :sensors
  resources :setpoints
  resources :users
  resources :logs

  get 'charts', to: 'charts#index'

  get '12hrs', to: 'charts#12hrs'
  get '6hrs', to: 'charts#6hrs'
  get '3hrs', to: 'charts#3hrs'
  get '1hr', to: 'charts#1hrs'

  get 'sensor_2a', to: 'logs#sensor_2a'
  get 'sensor_2b', to: 'logs#sensor_2b'

  post 'authenticate', to: 'authentication#authenticate'
  root to: 'charts#index'


end
