ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'
require 'vcr'
require 'rake'
require 'simplecov'
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes/vcr_cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
    config.filter_sensitive_data("<REDACTED>") do
      ENV['barchart_api_key']
    end
    config.default_cassette_options = {
      :match_requests_on => [:method,
        VCR.request_matchers.uri_without_param(:startDate)]
   }
  end
  def dummy_api_hit
    nil
  end
  # Add more helper methods to be used by all tests here...

  # def test_helper_dummy_api_hit
  #   # barchart daily data api hit return
  #   {"status":{"code":200,"message":"Success."},"results":
  #     [{"symbol":"AAPL","exchange":"BATS","name":"Apple Inc","dayCode":"R",
  #       "serverTimestamp":"2018-12-28T13:32:27-06:00","mode":"i","lastPrice":157.51,
  #       "tradeTimestamp":"2018-12-28T14:17:24-06:00","netChange":1.36,
  #       "percentChange":0.87,"unitCode":"2","open":157.3,"high":157.65,
  #       "low":154.55,"close":0,"flag":"","volume":1949701
  #     }]
  #   }
  # end
end
