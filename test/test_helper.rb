ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'
require 'vcr'
require 'rake'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes/vcr_cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true

    config.filter_sensitive_data("<REDACTED>") do
      ENV['barchart_api_key']
    end
  end

  # Add more helper methods to be used by all tests here...
end
