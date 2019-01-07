require 'test_helper'
require 'minitest/autorun'

class IexFetchDailyDataProcessorTest < ActiveSupport::TestCase

  test 'valid quote returns' do
    VCR.use_cassette('iex_fetch_daily_data_valid_quote') do
      @iex = IexFetchDailyDataProcessor.new
      @quote = @iex.quote('AAPL')
    end
    assert_equal 'AAPL', @quote.symbol
  end

  test 'invalid quote' do
    VCR.use_cassette('iex_fetch_daily_data_invalid_quote') do
      @iex = IexFetchDailyDataProcessor.new
      @quote = @iex.quote('ZZZ')
    end
    assert_equal nil, @quote
    assert_equal ['ZZZ'], @iex.symbols_not_found
  end

  test '#parse_quote_body returns formatted object' do
    VCR.use_cassette('iex_daily_date_parse_body') do
      @iex = IexFetchDailyDataProcessor.new
      @quote = @iex.quote('AAPl')
      @body = @iex.parse_quote_body(@quote)
    end

    expected = {:market_close_date=>"07-01-2019",
      :open=>144.5, :high=>148.55, :low=>143.8,
      :close=>148.26, :net_change=>6.07, :volume=>57288976}
    assert_equal expected, @body
  end

  test '#insert_daily_data adds valid record' do
    iex = IexFetchDailyDataProcessor.new
    symbol = stock_symbols(:aapl)
    valid_record = {:market_close_date=>"07-01-2019",
      :open=>144.5, :high=>148.55, :low=>143.8,
      :close=>148.26, :net_change=>6.07, :volume=>57288976}

    assert_difference('HistoricPrice.count') do
      iex.insert_daily_data(valid_record, symbol)
    end
  end
end
