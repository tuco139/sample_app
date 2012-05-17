require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
#require "active_record/railtie"
#require "action_controller/railtie"
#require "action_mailer/railtie"
#require "active_resource/railtie"
#require "sprockets/railtie"
# require "rails/test_unit/railtie"
require "rails/all"

#if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  #Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
#end
Bundler.require(:default, Rails.env) if defined?(Bundler)

module SampleApp
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.filter_parameters += [:password]
    # parameters by using an attr_accessible or attr_protected declaration.
    #config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    #config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    #config.assets.version = '1.0'
    if Rails.env.test?
      initializer :after => :initialize_dependency_mechanism do
      ActiveSupport::Dependencies.mechanism = :load
      end
    end
  end
end
