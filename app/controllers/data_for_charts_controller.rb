class DataForChartsController < ApplicationController
  def thirteen_percent
    render json: MarketMonitor.group_by_day(:created_at).count
  end
end
