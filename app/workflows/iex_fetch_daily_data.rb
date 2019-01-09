class IexFetchDailyData
  attr_reader :connector, :processor, :symbol_list

  def initialize connector, processor
    @connector = connector
    @processor = processor
  end

  def collect_stock_symbols
    @symbol_list = StockSymbol.all.pluck(:symbol)
  end

  def fetch_daily_price_data
    symbol_list.each_slice(25) do |chunk|
      chunk.each do |symbol|
        body = connector.get_quote symbol
        if body.nil?
          puts "#fetch_daily_price_data body nil"
        else
          processor.quote_body = body
          record = processor.parse_quote_body
          symbol = processor.find_stock_symbol symbol
          unless symbol.nil?
            processor.insert_daily_data record, symbol
          end
        end
      end
    end
  end
end
