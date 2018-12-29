class FetchDailyPriceHistoryWorker < ProcessWorker

  def perform
    daily_data_processor = BarchartDailyDataProcessor.new
    api_connection = BarchartApiConnector.new
    fetch_daily_data = FetchDailyData.new daily_data_processor, api_connection
    fetch_daily_data.collect_stock_symbols
    fetch_daily_data.fetch_daily_price_data
  end
end
