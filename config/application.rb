require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'pdfkit'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

PDFKit.configure do |config|
  config.wkhtmltopdf = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  config.default_options = {
    :encoding=>"UTF-8",
    :page_size=>"A4",
    :margin_top=>"0.25in",
    :margin_right=>"0.1in",
    :margin_bottom=>"0.25in",
    :margin_left=>"0.1in",
    :disable_smart_shrinking=> false
  }
end

module RailsPdf
  class Application < Rails::Application
      config.middleware.use PDFKit::Middleware, :print_media_type => true
  end
end


module BoyScouts
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
    #config.middleware.delete Rack::Lock
  end
end

#Rails.application.config.middleware.delete Rack::Lock
