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
        @data_parser.fetch_page_body(1)
      end
    end
  end

  test 'no connectivity raises socket error' do
    raises_exception = -> (a_url) { raise SocketError.new }
    @connection.stub(:fetch_page_body, raises_exception) do
       assert_raises SocketError do
         @connection.fetch_page_body @valid_url
       end
    end
  end
end
