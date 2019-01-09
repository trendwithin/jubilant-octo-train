class ImportPriceHistoryFromIexWorker < ProcessWorker
  def perform
    connector = IexConnector.new
    processor = IexFetchDailyDataProcessor.new
    fetch_daily_data = IexFetchDailyData.new connector, processor
    fetch_daily_data.collect_stock_symbols
    fetch_daily_data.fetch_daily_price_data
  end
end
