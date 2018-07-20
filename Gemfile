source 'https://rubygems.org'

ruby '2.3.7'

gem 'rails', '5.2.0'

group :production do
  gem 'pg', '~> 0.19'
  gem 'newrelic_rpm'
end

gem 'json'
gem 'thin'

# Assets
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'

gem 'formtastic'
gem 'cancancan'
gem 'inherited_resources'
gem 'responders'
gem 'exception_notification'
# gem 'rest-client', '~> 1.7.3'

group :development, :test do
  gem 'test-unit'
  gem 'foreman'
  gem 'factory_bot_rails'
  gem 'therubyracer'
#  gem 'taps', :require => false # has an sqlite dependency, which heroku hates
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
  gem 'rails-controller-testing'
end
