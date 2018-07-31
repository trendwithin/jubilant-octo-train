require 'test_helper'
require 'minitest/autorun'

class BarchartHistoricalDataProcessorTest < ActiveSupport::TestCase

  setup do
    VCR.use_cassette('barchart_historical_data_processor_test') do
      fhd = FetchHistoricalData.new
      fhd.stock_to_parse 'Z'
      @response_body = fhd.run
    end
    @barchart_historical_data = BarchartHistoricalDataProcessor.new(@response_body)
  end

  test 'response invalid' do
    @response_body['status']['code'] = 404
    barchart_historical_data = BarchartHistoricalDataProcessor.new(@response_body)
    assert_equal false, barchart_historical_data.parse_page_results
  end

  test 'response valid' do
    expected_count = 41
    first_value = { "symbol"=>"Z", "timestamp"=>"2018-06-01T00:00:00-04:00",
      "tradingDay"=>"2018-06-01", "open"=>59.89, "high"=>59.89, "low"=>58.37,
      "close"=>59.03, "volume"=>1677600, "openInterest"=>nil }

    results = @barchart_historical_data.parse_page_results
    assert_equal expected_count, results.count
    assert_equal first_value, results.first
  end

  test '#format_results AR' do
    results = @barchart_historical_data.parse_page_results
    expected = { :market_close_date=>"2018-06-01", :open=>59.89, :high=>59.89,
      :low=>58.37, :close=>59.03, :net_change=>1000000, :volume=>1677600 }

    result = @barchart_historical_data.format_results results.first
    assert_equal expected, result
  end

  test '#insert_historic_stock_price' do
    stock_symbol = stock_symbols(:fake)
    response_body = {"status"=>{"code"=>200, "message"=>"Success."},
      "results"=>[{"symbol"=>"FAKE", "timestamp"=>"2018-04-20T00:00:00-04:00",
      "tradingDay"=>"2018-04-20", "open"=>47, "high"=>47.97,
      "low"=>46.68, "close"=>47.18, "volume"=>1944100, "openInterest"=>nil} ] }
    barchart_historical_data = BarchartHistoricalDataProcessor.new(response_body)
    barchart_historical_data.insert_historic_stock_price stock_symbol
    record = StockSymbol.find_by_symbol('FAKE').historic_prices
      .where(market_close_date: '2018-04-20')
    refute record.empty?
  end

  # test '#insert_historic_stock_price duplicate record'
end
