class PriceHistoriesController < ApplicationController
  def index
    @todays_records = []
    HistoricPrice.todays_records.map { |rec| @todays_records << rec.stock_symbol.symbol }
  end

  def new
  end

  def fetch_price_history
    daily_data_processor = BarchartDailyDataProcessor.new
    fetch_daily_data = FetchDailyData.new daily_data_processor
    fetch_daily_data.collect_stock_symbols
    fetch_daily_data.fetch_daily_price_data
    redirect_to price_histories_path
  end
end
