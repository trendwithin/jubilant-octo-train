class BarchartHistoricalData
  attr_reader :historic_data

  def initialize historic_data
    @historic_data = historic_data
  end

  def parse_page_results
    status_valid? ? results = historic_data_results : (return false)
  end

  def insert_historic_stock_price stock_symbol
    if status_valid?
      historic_data_results.map do |obj|
        record = format_results obj
        create_historic_stock_price record, stock_symbol
      end
    else
      puts 'Log to Error'
    end
  end

  def format_results obj
    format_obj = {}
    format_obj[:market_close_date] = obj['tradingDay']
    format_obj[:open] = obj['open']
    format_obj[:high] = obj['high']
    format_obj[:low] = obj['low']
    format_obj[:close] = obj['close']
    format_obj[:net_change] = 1_000_000
    format_obj[:volume] = obj['volume']

    format_obj
  end

  private

  def create_historic_stock_price record, stock_symbol
    hp = stock_symbol.historic_prices.build(record)
    begin
      hp.save
    rescue ActiveRecord::NotNullViolation => active_record_not_null
    rescue PG::NotNullViolation => pg_not_null
    rescue ActiveRecord::RecordInvalid => invalid
    end
  end

  def historic_data_results
    historic_data['results']
  end

  def status_valid?
    true if historic_data['status']['code'] == 200
  end
end
