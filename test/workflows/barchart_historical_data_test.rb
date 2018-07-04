require 'test_helper'
require 'minitest/autorun'

class BarchartHistoricalDataTest < ActiveSupport::TestCase

  setup do
    VCR.use_cassette('barchart_historical_data_test') do
      fhd = FetchHistoricalData.new('Z')
      @response_body = fhd.run
    end
    @barchart_historical_data = BarchartHistoricalData.new(@response_body)
  end

  test 'response invalid' do
    @response_body['status']['code'] = 404
    barchart_historical_data = BarchartHistoricalData.new(@response_body)
    assert_equal false, barchart_historical_data.parse_page_results
  end

  test 'response valid' do
    expected_count = 44
    first_value = { "symbol"=>"Z", "timestamp"=>"2018-04-20T00:00:00-04:00",
                    "tradingDay"=>"2018-04-20", "open"=>47, "high"=>47.97,
                    "low"=>46.68, "close"=>47.18, "volume"=>1944100,
                    "openInterest"=>nil}
    barchart_historical_data = BarchartHistoricalData.new(@response_body)
    results = barchart_historical_data.parse_page_results
    assert_equal expected_count, results.count
    assert_equal first_value, results.first
  end

  test '#format_results AR' do
    barchart_historical_data = BarchartHistoricalData.new(@response_body)
    results = barchart_historical_data.parse_page_results
    expected = {:market_close_date=>"2018-04-20", :open=>47,
                :high=>47.97, :low=>46.68, :close=>47.18, :net_change=>1000000,
                :volume=>1944100}
    result = barchart_historical_data.format_results results.first
    assert_equal expected, result
  end

  test '#insert_historic_stock_price' do
    stock_symbol = stock_symbols(:fake)
    response_body = {"status"=>{"code"=>200, "message"=>"Success."},
      "results"=>[{"symbol"=>"FAKE", "timestamp"=>"2018-04-20T00:00:00-04:00",
      "tradingDay"=>"2018-04-20", "open"=>47, "high"=>47.97,
      "low"=>46.68, "close"=>47.18, "volume"=>1944100, "openInterest"=>nil} ] }
    barchart_historical_data = BarchartHistoricalData.new(response_body)
    barchart_historical_data.insert_historic_stock_price stock_symbol
    record = StockSymbol.find_by_symbol('FAKE').historic_prices
      .where(market_close_date: '2018-04-20')
    refute record.empty?
  end

  test '#insert_historic_stock_price with historical data' do
    data = @barchart_historical_data.historic_data['results'].take(1)
    stock_symbol = StockSymbol.new(symbol: data.first['symbol'],
      company_name: 'Zillow',
      sector_id: stock_symbols(:fake).sector_id, industry_id: stock_symbols(:fake).industry_id)
    stock_symbol.save
    stock_symbol = StockSymbol.find_by_symbol(data.first['symbol'])
    data_date = data.first['tradingDay']
    @barchart_historical_data.insert_historic_stock_price stock_symbol
    record = StockSymbol.find_by_symbol(stock_symbol.symbol).historic_prices
      .where(market_close_date: data_date)
    refute record.empty?
  end
end
