class StockSymbol < ApplicationRecord
  belongs_to :sector
  belongs_to :industry
  has_many :historic_prices
end
