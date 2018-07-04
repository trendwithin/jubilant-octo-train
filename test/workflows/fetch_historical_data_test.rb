require 'test_helper'
require 'minitest/autorun'

class FetchHistoricalDataTest < ActiveSupport::TestCase

  test 'response_body' do
    VCR.use_cassette('barchart_historical_data') do
      fhd = FetchHistoricalData.new('Z')
      @response_body = fhd.run
    end
    assert_equal 200, @response_body['status']['code']
    assert_equal ['status', 'results'], @response_body.keys
    assert_equal 'Success.', @response_body['status']['message']
  end
end
