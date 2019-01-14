class MarketMonitorGoogleSheetsController < ApplicationController
  def index
    @market_monitors = MarketMonitor.limit(500).order_by_date_desc
  end
end
