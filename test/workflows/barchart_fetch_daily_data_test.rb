class BarchartDailyDataTest < ActiveSupport::TestCase

  setup do
    VCR.use_cassette('barchart_daily_data_test') do
      @bhd = BarchartDailyData.new
      @fdd = FetchDailyData.new @bhd
    end
  end
  
  test 'returns collection of symbols' do
    symbols = @fdd.collect_stock_symbols
    assert_equal 3, symbols.count
    assert symbols.include?('FAKE')
    assert symbols.include?('TESTR')
  end

  test 'returns daily price for AAPL' do
    @fdd.collect_stock_symbols
    assert_difference 'HistoricPrice.count' do
      @fdd.fetch_daily_price_data
    end
    assert_equal 'AAPL', HistoricPrice.last.stock_symbol.symbol
  end
end
