class IexFetchDailyDataProcessor
  attr_accessor :quote_body

  def parse_quote_body
    format_obj = {}
    format_obj[:market_close_date] = DateTime.now.strftime("%d-%m-%Y")
    format_obj[:open] = quote_body['open']
    format_obj[:high] = quote_body['high']
    format_obj[:low] = quote_body['low']
    format_obj[:close] = quote_body['close']
    format_obj[:net_change] = quote_body['change']
    format_obj[:volume] = quote_body['latest_volume']

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
