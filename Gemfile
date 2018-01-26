source 'https://rubygems.org'

gem 'rails'
gem 'mysql2'
gem 'rack-attack'
gem 'thin'
gem 'whenever', :require => false
gem 'awesome_print'
gem 'active_model_serializers'
gem 'time_difference'
gem 'rails_admin'
gem 'figaro'
gem 'chartkick'
gem 'remote_syslog_logger'
gem 'twitter-bootstrap-rails', git: 'https://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'newrelic_rpm'
# Raspberry specific
gem 'rpi_gpio', :require => false
gem 'bcrypt'
gem 'jwt'
gem 'simple_command'
gem 'rack-cors'
gem 'sidekiq'
gem "redis-store"
gem 'redis-rails'
gem "redis-rack-cache"


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-rake'
  gem 'guard-spring'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'spring-commands-rspec'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
end

group :test do
  gem "simplecov"
  gem "codeclimate-test-reporter"
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
