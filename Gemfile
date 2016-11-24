source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.1'
gem 'mysql2'
gem 'rack-attack'
gem 'thin'
gem 'whenever', :require => false
# Raspberry specific
gem 'rpi_gpio', :require => false
gem 'ruby-gpio', :require => false

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# encoding and decoding of HMACSHA256 tokens
gem 'jwt'
# The simple command gem is an easy way of creating services.
# Its role is similar to the role of a helper, but instead of facilitating
# the connection between the controller and the view, it does the same for the controller and the model.
#In this way, we can shorten the code in the models and controllers.
gem 'simple_command'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
