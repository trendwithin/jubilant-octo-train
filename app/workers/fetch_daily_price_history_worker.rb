class FetchDailyPriceHistoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    daily_data_processor = BarchartDailyDataProcessor.new
    fetch_daily_data = FetchDailyData.new daily_data_processor
    fetch_daily_data.collect_stock_symbols
    fetch_daily_data.fetch_daily_price_data
  end
end
