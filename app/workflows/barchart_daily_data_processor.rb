class BarchartDailyDataProcessor

  def format_daily_results obj
    format_obj = {}
    format_obj[:market_close_date] = DateTime.now.strftime("%d-%m-%Y")
    format_obj[:open] = obj['open']
    format_obj[:high] = obj['high']
    format_obj[:low] = obj['low']
    format_obj[:close] = obj['close']
    format_obj[:net_change] = obj['netChange']
    format_obj[:volume] = obj['volume']

    format_obj
  end

  def insert_daily_data record, stock_symbol
    daily = stock_symbol.historic_prices.build(record)
    begin
      daily.save
    rescue ActiveRecord::NotNullViolation => active_record_not_null
    rescue PG::NotNullViolation => pg_not_null
    rescue ActiveRecord::RecordInvalid => invalid
    end
  end
end
