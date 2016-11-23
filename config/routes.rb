Rails.application.routes.draw do



  resources :gpios
      resources :items
      resources :sensors
      resources :setpoints
      resources :users
      resources :logs
    



  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

end
