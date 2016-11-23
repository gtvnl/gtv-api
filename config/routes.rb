Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do

      resources :items
      resources :sensors
      resources :setpoints
      resources :users
      resources :logs
      resources :gpios

      root to: 'sensors#index'
    end
   end


  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

end
