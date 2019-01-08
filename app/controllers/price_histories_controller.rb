class PriceHistoriesController < ApplicationController
  def index
    @todays_records = []
    HistoricPrice.todays_records.map { |rec| @todays_records << rec.stock_symbol.symbol }
  end

  def new
  end

  def fetch_price_history
    ImportPriceHistoryFromIexWorker.perform_async
    redirect_to price_histories_path
  end
end
