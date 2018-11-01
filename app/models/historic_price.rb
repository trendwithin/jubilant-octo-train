class HistoricPrice < ApplicationRecord
  belongs_to :stock_symbol

  def self.todays_records
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
