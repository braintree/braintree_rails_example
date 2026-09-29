source 'https://rubygems.org'

ruby '4.0.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '8.1.4'
# Bootsnap for Rails to optimize and cache expensive computations, Read more: https://github.com/Shopify/bootsnap
gem 'bootsnap', '~> 1.21'
gem 'sprockets-rails', '~> 3.5'
gem 'sprockets', '~> 4.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.13'

gem 'braintree', '~> 4.5'
# Braintree and the test doubles use OpenStruct, now a separate gem in Ruby 4.
gem 'ostruct'

gem 'dotenv', '~> 2.0'

# Application server compatible with Rails 8 and Rack 3.
gem 'puma', '~> 7.0'
gem 'rack', '~> 3.2'

group :development, :test do
  # Use sqlite in development and test for ease of setup
  gem 'sqlite3', '~> 2.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Only running rspec in development and test, rails-controller-testing gem needed with Rails 5
  gem 'rspec-rails', '~> 8.0'
  gem 'rails-controller-testing'
end

group :production do
  # Use postgres in production as many prod environments don't support sqlite (e.g. Heroku)
  gem 'pg', '~> 1.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 4.2'

  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.1', '>= 3.1.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
