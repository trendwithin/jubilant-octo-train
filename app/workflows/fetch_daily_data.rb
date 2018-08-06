class FetchDailyData
  attr_reader  :symbol_list, :api_connection, :barchart_historical_data

  def initialize obj
    @barchart_historical_data = obj
  end

  def collect_stock_symbols
    @symbol_list = StockSymbol.all.pluck(:symbol)
  end

  def fetch_daily_price_data
    symbol_list.each_slice(25) do |symbols|
      url = build_url symbols
      connection = connect url
      fetch_page
      body = response_body_results fetch_parsed_response_body_in_JSON
      parse_body_data body
    end
  end

  def build_url symbols
    "https://marketdata.websol.barchart.com/getQuote.json?apikey=" +
    ENV['barchart_api_key'] + "&symbols=#{symbols.join(',')}"
  end

  private

  def parse_body_data body
    body.each do |obj|
      symbol = obj['symbol']
      next unless stock_symbol = find_stock_symbol(symbol)
      formatted = format_obj obj
      daily_data_insert formatted, stock_symbol
    end
  end

  def find_stock_symbol symbol
    StockSymbol.find_by_symbol(symbol)
  end

  def format_obj obj
    barchart_historical_data.format_daily_results obj
  end

  def daily_data_insert formatted, symbol
    barchart_historical_data.insert_daily_data formatted, symbol
  end

  def response_body_results response_body
    response_body['results']
  end

  def connect url
    @api_connection = BarchartApiConnector.new url
  end

  def fetch_page
    api_connection.fetch_page_body
  end

  def fetch_parsed_response_body_in_JSON
    api_connection.parse_page_response_body_JSON
  end
end
