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

  def four_percent_index_chart_data
    lookback = lookback_period
    spy = StockSymbol.find_by_symbol('SPY')
    four_pct = MarketMonitor.order_by_date_desc.limit("#{lookback}").pluck(:market_close_date, :up_four_pct_daily, :down_four_pct_daily)
    four_pct_down = MarketMonitor.order_by_date_desc.limit("#{lookback}").pluck(:market_close_date, :down_four_pct_daily)
    historic_prices = spy.historic_prices.date_desc("#{lookback}").pluck(:close)
    @formatted_results = []
    four_pct.each_index do |index|
      @formatted_results << four_pct[index].push(historic_prices[index])
    end
    @formatted_results.reverse!
    render json: @formatted_results
  end

  def high_low_data
    high_low_data = DailyHighLow.all
    render json: high_low_data
  end

  def stock_price_data
    lookback = lookback_period
    market_index = lookback_market_index
    symbol = StockSymbol.find_by_symbol("#{market_index}")
    price_data = symbol.historic_prices.date_asc("#{lookback}")
    render json: price_data
  end

  def new_leadership
    data = FivePeriodLeader.date_desc(90)
    render json: data
  end

  def momentum_universe
    data = TradeableUniverse.date_desc(90)
    render json: data
  end

  def primary_ratio_chart_data
    lookback = lookback_period
    market_index = lookback_market_index
    lookback_index = StockSymbol.find_by_symbol("#{market_index}")
    twenty_five_pct = MarketMonitor.order_by_date_desc.limit("#{lookback}").pluck(:market_close_date, :up_twenty_five_pct_quarter, :down_twenty_five_pct_quarter)
    twenty_five_pct_down = MarketMonitor.order_by_date_desc.limit("#{lookback}").pluck(:market_close_date, :down_twenty_five_pct_quarter)
    historic_prices = lookback_index.historic_prices.date_desc("#{lookback}").pluck(:close)
    @formatted_results = []
    twenty_five_pct.each_index do |index|
      @formatted_results << twenty_five_pct[index].push(historic_prices[index])
    end
    @formatted_results.reverse!
    render json: @formatted_results
  end

  def daily_price_history
    symbol = StockSymbol.find_by_symbol('SPY')
    lookback = 250
    historic_prices = symbol.historic_prices.date_desc("#{lookback}").pluck(:market_close_date, :close)
    render json: historic_prices
  end

  private
  def lookback_period
    if params[:lookback] == 'undefined'
      250
    else
      params[:lookback]
    end
  end

  def lookback_market_index
    params[:market_index] == 'undefined' ? 'SPY' : params[:market_index]
  end

  def fetch_symbol
    params[:symbol] == 'undefined' ? 'SPY' : params[:symbol]
  end
end
