class TradeableUniverse < ApplicationRecord
  validates :three_month, presence: true, numericality: true
  validates :six_month, presence: true, numericality: true
end
