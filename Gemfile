source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '5.2.2'

group :production do
  gem 'pg'
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

group :development, :test do
  gem 'test-unit'
  gem 'foreman'
  gem 'factory_bot_rails'
  gem 'therubyracer'
  gem 'sqlite3'
  gem 'rake'
  gem 'listen'
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
