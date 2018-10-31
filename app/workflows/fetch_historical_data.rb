class FetchHistoricalData
  attr_accessor :api_connection
  attr_reader :symbol, :url, :start_date

  def initialize symbol=''
    @symbol = symbol
    @start_date = (Time.now - 60.days).strftime "%Y%m%d" + "000000"
  end

  def stock_to_parse symbol
    @symbol = symbol
  end

  def run
    connect
    fetch_page
    parse_page_body
  end


  private

  def build_url
    "https://marketdata.websol.barchart.com/getHistory.json?apikey=" +
    ENV['barchart_api_key'] + "&symbol=#{symbol}&type=daily&startDate=#{start_date}"
  end

  def connect
    @api_connection = BarchartApiConnector.new(build_url)
  end

  def fetch_page
    api_connection.fetch_page_body
  end

  def parse_page_body
    api_connection.parse_page_response_body_JSON
  end
end
