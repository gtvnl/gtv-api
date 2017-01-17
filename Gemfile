source 'https://rubygems.org'

gem 'rails', '5.0.0.1'
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
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'simple_command'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
