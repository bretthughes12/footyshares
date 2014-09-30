source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '3.2.19'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

gem 'json'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

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
gem 'cancan'
gem 'inherited_resources'
gem 'exception_notification'
gem 'strong_parameters'

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
