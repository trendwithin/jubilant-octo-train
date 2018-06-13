class StockSymbol < ApplicationRecord
  belongs_to :sector
  belongs_to :industry
  has_many :historic_prices

  validates :symbol, presence: true
  validates :company_name, presence: true
end
