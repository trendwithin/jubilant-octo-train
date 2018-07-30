class FetchFiftyTwoWeekHigh
  attr_reader :agent, :symbols

  def initialize agent
    @agent = agent
    @symbols = []
  end

  def run
    body = fetch_page_body
    parse_body body, 'data', 'symbol'
  end

  def new_highs
    insert_new_highs
  end

  private

  def fetch_page_body
    agent.fetch_page_body
    agent.parse_page_response_body_JSON
  end

  def parse_body body, body_key, key
    body["#{body_key}"].map do |elem|
      symbols << elem["#{key}"]
    end
  end

  def insert_new_highs
    symbols.map do |symbol|
      FiftyTwoWeekHigh.create!(symbol: symbol)
    end
  end
end
