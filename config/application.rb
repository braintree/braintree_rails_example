require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BraintreeRailsExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
    # New for Rails 5.2:
    # Make Active Record use stable #cache_key alongside new #cache_version method.
    # This is needed for recyclable cache keys.
    Rails.application.config.active_record.cache_versioning = true
    # Use AES-256-GCM authenticated encryption for encrypted cookies.
    Rails.application.config.action_dispatch.use_authenticated_cookie_encryption = true
    # Add default protection from forgery to ActionController::Base instead of in
    # ApplicationController
    Rails.application.config.action_controller.default_protect_from_forgery = true
    # Use SHA-1 instead of MD5 to generate non-sensitive digests, such as the ETag header.
    Rails.application.config.active_support.use_sha1_digests = true
    # Make `form_with` generate id attributes for any generated HTML tags.
    Rails.application.config.action_view.form_with_generates_ids = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
