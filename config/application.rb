require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'tiddle'
# require 'warden'
# require 'forwardable'
# require 'warden/mixins/common'
# require 'warden/proxy'
# require 'warden/manager'
# require 'warden/errors'
# require 'warden/strategies'
# require 'warden/strategies/base'
# require 'warden/serializers'
# require 'warden/serializers/base'
# require 'warden/serializers/cookie'
# require 'warden/serializers/session'
# ^GET RID of THIS FIXME

module OurBarnBoard
  class Application < Rails::Application
    config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
