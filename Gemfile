source 'https://rubygems.org'

ruby '2.1.3'

gem 'rails', '~> 4.2.0.beta2' # PENDING: [Rails 4.2] Remove wakka.

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

gem 'json'
gem 'thin'

# Assets
gem 'sass-rails', '~> 5.0.0.beta1' # PENDING: [Rails 4.2] Remove wakka.
gem 'coffee-rails', '~> 4.0.0' # PENDING: [Rails 4.2] Remove wakka.
gem 'uglifier'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'formtastic'
gem 'cancancan'
gem 'inherited_resources', github: 'andriytyurnikov/inherited_resources', branch: 'rails_4_2'
gem 'responders'
gem 'exception_notification'

group :development, :test do
  gem 'mysql2'
  gem 'test-unit'
  gem 'foreman'
  gem 'factory_girl_rails'
  gem 'therubyracer'
  gem 'taps', :require => false # has an sqlite dependency, which heroku hates
  gem 'sqlite3'
  gem 'rake'
end

group :development do
  gem 'annotate'
  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'simplecov', :require => false  
end
