class MarketMonitor < ApplicationRecord
  validates :market_close_date, presence: true
  validates :market_close_date, uniqueness: true
  validates :up_four_pct_daily, presence: true, numericality: { only_integer: true}
  validates :down_four_pct_daily, presence: true, numericality: { only_integer: true}
  validates :up_twenty_five_pct_quarter, presence: true, numericality: { only_integer: true}
  validates :down_twenty_five_pct_quarter, presence: true, numericality: { only_integer: true}
  validates :up_twenty_five_pct_month, presence: true, numericality: { only_integer: true }
  validates :down_twenty_five_pct_month, presence: true, numericality: { only_integer: true}
  validates :up_thirteen_pct_six_weeks, presence: true, numericality: { only_integer: true }
  validates :down_thirteen_pct_six_weeks, presence: true, numericality: { only_integer: true}
  validates :up_fifty_pct_month, presence: true, numericality: { only_integer: true }
  validates :down_fifty_pct_month, presence: true, numericality: { only_integer: true }
  validates :total_stocks, presence: true, numericality: { only_integer: true }

  def self.order_by_date_desc
    order(:market_close_date)
  end

  def self.monitor
    thirteen_percent_up = {"name":"Thirteen Pct Up"}
    thirteen_percent_down = {"name":"Thirteen Pct Down"}

    data_one = {}
    data_two = {}

    records = MarketMonitor.order_by_date_desc.limit(10)
    data_one.merge! records.pluck(:market_close_date, :up_thirteen_pct_six_weeks).to_h
    vals = { data: data_one }
    thirteen_percent_up.merge!(vals)

    data_two.merge! records.pluck(:market_close_date, :down_thirteen_pct_six_weeks).to_h
    vals_two = { data: data_two}
    thirteen_percent_down.merge!(vals_two)
    @data = thirteen_percent_up, thirteen_percent_down
  end
end
