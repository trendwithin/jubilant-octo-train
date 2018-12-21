class ChartsController < ApplicationController
  def view
    render json: MarketMonitor.group_by_day(:up_thirteen_pct_six_weeks).count
  end
end
