require 'test_helper'
require 'minitest/autorun'

class IexFetchDailyDataProcessorTest < ActiveSupport::TestCase

  setup do
    VCR.use_cassette('iex_connector_test') do
      @iex_connector = IexConnector.new
      @quote = @iex_connector.get_quote('AAPL')
      @iex_fetch_daily_data = IexFetchDailyDataProcessor.new
    end
  end

  test '#parse_quote_body returns formatted object' do
    VCR.use_cassette('iex_daily_date_parse_body') do
      @iex_fetch_daily_data.quote_body = @quote
      @body = @iex_fetch_daily_data.parse_quote_body
    end

    expected = {:market_close_date=>"07-01-2019",
      :open=>148.7, :high=>148.83, :low=>145.9, :close=>148.26,
      :net_change=>-1.035, :volume=>31077781}
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
