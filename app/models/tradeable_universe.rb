class TradeableUniverse < ApplicationRecord
  validates :three_month, presence: true, numericality: true
  validates :six_month, presence: true, numericality: true

  scope :date_desc, -> (limit) { order("created_at desc").limit(limit) }
end
