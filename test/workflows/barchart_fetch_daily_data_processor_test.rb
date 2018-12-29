class BarchartDailyDataProcessorTest < ActiveSupport::TestCase

  setup do
    VCR.use_cassette('barchart_daily_data_processor_test') do
      @bhd = BarchartDailyDataProcessor.new
      @api_connection = BarchartApiConnector.new
      @fdd = FetchDailyData.new @bhd, @api_connection
    end
  end

  test 'returns collection of symbols' do
    symbols = @fdd.collect_stock_symbols
    assert_equal 3, symbols.count
    assert symbols.include?('FAKE')
    assert symbols.include?('TESTR')
  end

  # NB:  Reset Test- Hit Rate Limit and Coughing Error
  # test 'returns daily price for AAPL' do
  #   VCR.use_cassette('daily_price_insert_test') do
  #     @fdd.collect_stock_symbols
  #     assert_difference 'HistoricPrice.count' do
  #       @fdd.fetch_daily_price_data
  #     end
  #   end
  #   assert_equal 'AAPL', HistoricPrice.last.stock_symbol.symbol
  # end
end
