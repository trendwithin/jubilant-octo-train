class IexFetchDailyDataProcessor
  attr_reader :symbols_not_found
  def initialize
    @symbols_not_found = []
  end

  def quote symbol
    begin
      quote = IEX::Resources::Quote.get("#{symbol}")
    rescue IEX::Errors::ClientError => iex_client_error
    rescue IEX::Errors::SymbolNotFoundError => iex_symbol_not_found_error
      symbols_not_found << symbol
    end
    quote
  end

  def parse_quote_body quote_body
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
