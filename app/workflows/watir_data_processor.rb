class WatirDataProcessor
  attr_reader :connector, :body

  def initialize connector
    @connector = connector
    @body = nil
  end

  def fetch_all_time_highs
    connector.goto('https://www.barchart.com/stocks/highs-lows/highs?screener=us&timeFrame=alltime&page=all')
    response_body = parse_response_body
    insert_data response_body, AllTimeHigh
  end

  def fetch_all_time_lows
    connector.goto('https://www.barchart.com/stocks/highs-lows/lows?screener=us&timeFrame=alltime&page=all')
    response_body = parse_response_body
    insert_data response_body, AllTimeLow
  end

  def fetch_fifty_two_week_highs
    connector.goto('https://www.barchart.com/stocks/highs-lows/highs?screener=us&timeFrame=1y&page=all')
    response_body = parse_response_body
    insert_data response_body, FiftyTwoWeekHigh
  end

  def fetch_fifty_two_week_lows
    connector.goto('https://www.barchart.com/stocks/highs-lows/lows?screener=us&timeFrame=1y&page=all')
    response_body = parse_response_body
    insert_data response_body, FiftyTwoWeekLow
  end

  def parse_response_body
    body = connector.element(css: "tbody").text.strip.split("\n").each_slice(9)
    body
  end

  def insert_data body, ar
    body.each do |symbol|
      ar.create!(symbol: symbol.first)
    end
  end
end
