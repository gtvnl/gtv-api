Rails.application.routes.draw do
  root to: 'charts#index_day'

  # config/routes.rb
  require "sidekiq/web"
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest("admin")) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest("Raspberry1!"))
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :meters
  resources :gpios
  resources :sensors
  resources :setpoints
  resources :users
  resources :logs

  get 'dag', to: 'charts#index_day'
  get 'week', to: 'charts#index_week'

  get 'sensor_2a', to: 'logs#sensor_2a'
  get 'sensor_2b', to: 'logs#sensor_2b'

  post 'authenticate', to: 'authentication#authenticate'


end
