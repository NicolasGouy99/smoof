require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smoof
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :all
      g.fallbacks[:all] = :erb
      g.test_framework  :test_unit, fixture: false
      g.stylesheets     false
    end

#    config.paths['db/migrate'] = ['db/my_migrate']

  end
end
