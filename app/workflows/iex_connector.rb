class IexConnector
  attr_reader :symbols_not_found
  def initialize
    @symbols_not_found = []
  end

  def get_quote symbol
    begin
      quote = IEX::Resources::Quote.get("#{symbol}")
    rescue IEX::Errors::ClientError => iex_client_error
    rescue IEX::Errors::SymbolNotFoundError => iex_symbol_not_found_error
      symbols_not_found << symbol
    end
    quote
  end
end
