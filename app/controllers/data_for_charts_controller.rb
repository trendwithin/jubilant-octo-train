class DataForChartsController < ApplicationController
  def thirteen_percent
    render json: MarketMonitor.group_by_day(:created_at).count
  end

  def monitor
    render json: MarketMonitor.monitor
  end

  def googs
    spy = StockSymbol.find_by_symbol('SPY')
    four_pct = MarketMonitor.order_by_date_desc.limit(250).pluck(:market_close_date, :up_four_pct_daily)
    historic_prices = spy.historic_prices.date_desc(250).pluck(:close)
    @formatted_results = []
    four_pct.each_index do |index|
      @formatted_results << four_pct[index].push(historic_prices[index])
    end

    render json: @formatted_results
 end
end
