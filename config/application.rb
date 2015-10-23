require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yellper
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += [
      '2half.pxm',
      'burgers.jpg',
      'dish.png',
      'logo.png',
      'logoHover.png',
      'pho.jpg',
      'salad.jpg',
      'yelp_0_star.png',
      'yelp_1_half_star.png',
      'yelp_1_star.png',
      'yelp_2_half_star.png',
      'yelp_2_star.png',
      'yelp_3_half_star.png',
      'yelp_3_star.png',
      'yelp_4_half_star.png',
      'yelp_4_star.png',
      'yelp_5_star.pxm',
      'application.js',
      'comments_toggle.js',
      'application.css',
      'style.css'
    ]

    config.serve_static_files = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
