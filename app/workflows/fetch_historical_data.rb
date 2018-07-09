class FetchHistoricalData
  attr_accessor :api_connection
  attr_reader :symbol, :url

  def initialize symbol
    @url = "https://marketdata.websol.barchart.com/getHistory.json?apikey=" +
    ENV['barchart_api_key'] + "&symbol=#{symbol}&type=daily&startDate=20180420000000"
  end

  def run
    connect
    fetch_page
    fetch_parsed_response_body_in_JSON
  end


  private

  def connect
    @api_connection = BarchartApiConnect.new(url)
  end

  def fetch_page
    api_connection.fetch_page_body
  end

  def fetch_parsed_response_body_in_JSON
    api_connection.parse_page_response_body_JSON
  end
end
