require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Foodcircles
  class Engine < Rails::Engine

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      # Register image overlays
      # removing this temporarily, as it works only on Spree 0.70.x
      # [ImageOverlay::Overlays::Image,
      #  ImageOverlay::Overlays::Text
      # ].each &:register

    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc

  end


  class Application < Rails::Application
    config.middleware.use "PDFKit::Middleware", :print_media_type => true

    # config.paperclip_defaults = {
    #   :storage => :s3,
    #   :s3_credentials => {
    #     :bucket => 'foodcircles',
    #     :access_key_id => '0BRVRK6FWACPYQ6BCSR2',
    #     :secret_access_key => 'DXbUDzUdDIvyA9x3jajgDoM4/szI783MIujFp39E'
    #   }
    # }

    config.app_generators do |c|
      c.test_framework :rspec
      c.integration_tool :rspec
      c.performance_tool :rspec
    end
  end
end
