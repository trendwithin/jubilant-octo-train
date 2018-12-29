require 'test_helper'
require 'minitest/autorun'

class MechanizeConnectorTest < ActiveSupport::TestCase

  setup do
    valid_url = 'http://www.example.com'
    @connection = MechanizeConnector.new(valid_url)
  end

  test 'invalid url raisies mechanize response code error' do
    VCR.use_cassette('connection_error') do
      @url = 'http://www.trendwithin.com/nopage'
      @data_parser = MechanizeConnector.new(@url)
      assert_raises Mechanize::ResponseCodeError do
        @data_parser.mechanize_connector_fetch_page(1)
      end
    end
  end

  test 'no connectivity raises socket error' do
    raises_exception = -> (a_url) { raise SocketError.new }
    @connection.stub(:mechanize_connector_fetch_page, raises_exception) do
       assert_raises SocketError do
         @connection.mechanize_connector_fetch_page @valid_url
       end
    end
  end
end
