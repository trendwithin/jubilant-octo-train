class StockSymbol < ApplicationRecord
  after_save :process_historical_data
  belongs_to :sector
  belongs_to :industry
  has_many :historic_prices

  validates :symbol, presence: true
  validates :company_name, presence: true

  def process_historical_data
    historical_data = FetchHistoricalData.new(self.symbol).run
    bhd = BarchartHistoricalData.new(historical_data)
    bhd.insert_historic_stock_price(self)
  end
end
