require 'test_helper'
require 'minitest/autorun'

class IexFetchDailyDataTest < ActiveSupport::TestCase

  test 'valid quote retrun' do
    VCR.use_cassette('iex_fetch_daily_data_valid_quote') do
      @iex = IexFetchDailyData.new
      @quote = @iex.quote('AAPL')
    end
    assert_equal 'AAPL', @quote.symbol
  end

  test 'invalid quote' do
    VCR.use_cassette('iex_fetch_daily_data_invalid_quote') do
      @iex = IexFetchDailyData.new
      @quote = @iex.quote('ZZZ')
      assert_equal nil, @quote
      assert_equal ['ZZZ'], @iex.symbols_not_found
    end
  end
end
