source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails4-autocomplete'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# User Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'

# User Authorization
gem 'royce'

# UI
gem 'bootstrap-sass', '~> 3.3.6'
gem 'autoprefixer-rails'


# Utils
gem 'breadcrumbs_on_rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'rails-jquery-autocomplete'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'pg'
  # gem 'rails_12factor'
end

group :development, :test do
  gem 'mysql2', '>= 0.3.13', '< 0.5'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry'
  gem 'priscilla'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rubocop', '~> 0.42.0', require: false
  gem 'brakeman', require: false
  gem 'rubycritic', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'fivemat'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end
