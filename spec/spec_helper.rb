# This file is copied
require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
    ENV["RAILS_ENV"] ||= 'test'
    unless defined?(Rails)
      require File.dirname(__FILE__) + "/../config/environment"
    end
    require File.expand_path("../../config/environment", __FILE__)
    require 'rspec/rails'
    #require 'rspec/autorun'
    Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
    # Requires supporting ruby files with custom matchers and macros, etc,
    # in spec/support/ and its subdirectories.
    #Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
 
    RSpec.configure do |config|
      # ## Mock Framework
      #
      # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
      #
      # config.mock_with :mocha
      # config.mock_with :flexmock
      # config.mock_with :rr
      config.mock_with :rspec
      # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
      config.fixture_path = "#{::Rails.root}/spec/fixtures"
    
      # If you're not using ActiveRecord, or you'd prefer not to run each of your
      # examples within a transaction, remove the following line or assign false
      # instead of true.
      config.use_transactional_fixtures = true
    
      # If true, the base class of anonymous controllers will be inferred
      # automatically. This will be the default behavior in future versions of
      # rspec-rails.
      #config.infer_base_class_for_anonymous_controllers = false
      ActiveSupport::Dependencies.clear
      
      def test_sign_in(user)
        controller.sign_in(user)
      end
    end
end

Spork.each_run do
end

