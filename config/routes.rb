Rails.application.routes.draw do
  resources :setpoints
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do

      resources :items
      resources :sensors
      root to: 'sensors#index'
    end
   end


  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

  end
end
