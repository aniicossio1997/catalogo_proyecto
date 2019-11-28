require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Catalogo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |generator|
      generator.test_framework :rspec
    end
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :es
    config.to_prepare do
      # Configure single controller layout
      Devise::SessionsController.layout 'frontend'
      Devise::RegistrationsController.layout 'backend'
    end
  end
end
