Rails.application.routes.draw do
  namespace :api do
    scope module: 'api' do
      namespace :v1 do

      resources :items
      resources :sensors
      resources :setpoints

      root to: 'sensors#index'
    end
   end


  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

  end
end
