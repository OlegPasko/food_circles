source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'whenever', :require => false
gem 'activerecord-postgis-adapter'
gem 'rgeo'
gem 'haml-rails'
gem 'devise'
gem 'devise-token_authenticatable'
gem 'high_voltage'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly'
gem "rails_admin"
gem 'twilio-ruby'
gem 'fastercsv'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'urbanairship'
gem 'execjs'
gem 'mail'
gem 'pdfkit'
gem 'stripe'
gem 'paperclip'
gem 'aws-sdk'
gem 'rb-readline'
gem 'mandrill-rails'
gem 'figaro'

gem 'gibbon'

gem 'omniauth-facebook', '1.4.0'
gem 'omniauth-twitter'

gem 'friendly_id'
gem 'will_paginate'

gem 'rack-mini-profiler', group: [:development, :test]

gem 'twitter'

gem 'meta-tags', :require => 'meta_tags'
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'draper'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'zeus'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem "timecop"
end
