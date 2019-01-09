require 'minitest/autorun'

class IexConnectorTest < ActiveSupport::TestCase
  test 'connects to IEX' do
    VCR.use_cassette('iex_connector_test') do
      @iex = IexConnector.new
      @quote = @iex.get_quote('AAPL')
    end
    refute_equal nil, @quote
  end

  test 'invalid quote' do
    VCR.use_cassette('iex_fetch_daily_data_invalid_quote') do
      @iex = IexConnector.new
      @invalid_quote = @iex.get_quote('ZZZ')
    end
    assert_nil @invalid_quote
    assert_equal ['ZZZ'], @iex.symbols_not_found
  end
end
