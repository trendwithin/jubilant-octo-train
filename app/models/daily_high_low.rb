class DailyHighLow < ApplicationRecord
  validates :one_month_high, :one_month_low, presence: true
  validates :three_month_high, :three_month_low, presence: true
  validates :six_month_high, :six_month_low, presence: true
  validates :fifty_two_week_high, :fifty_two_week_low, presence: true
  validates :all_time_high, :all_time_low, presence: true
  validates :year_to_date_high,:year_to_date_low, presence: true
  validates :market_close_date, presence: true
  validates :market_close_date, uniqueness: true

  def self.order_by_date_desc
    order('market_close_date desc')
  end
end
