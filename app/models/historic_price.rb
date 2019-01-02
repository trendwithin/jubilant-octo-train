class HistoricPrice < ApplicationRecord
  belongs_to :stock_symbol

  scope :date_desc, -> (limit) { order("market_close_date desc").limit(limit) }

  def self.todays_records
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
