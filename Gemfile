source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.5'
# Bootsnap for Rails 5 to optimize and cache expensive computations, Read more: https://github.com/Shopify/bootsnap
gem 'bootsnap', '1.9.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'braintree', '~> 2.87'

gem 'dotenv', '~> 2.0'

group :development, :test do
  # Use sqlite in development and test for ease of setup
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Only running rspec in development and test, rails-controller-testing gem needed with Rails 5
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end

group :production do
  # Use postgres in production as many prod environments don't support sqlite (e.g. Heroku)
  gem 'pg', '~> 0.21.0'
  # Use Heroku asset addressing scheme and logging in production; should not affect other environments
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.1', '>= 3.1.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
