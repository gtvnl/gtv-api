Rails.application.routes.draw do
constraints :subdomain => 'api' do
    namespace :v1 do
      resources :items
      resources :sensors
      root to: 'sensors#index'

  end

  post 'authenticate', to: 'authentication#authenticate'
  root to: 'home#index'

 end
end
