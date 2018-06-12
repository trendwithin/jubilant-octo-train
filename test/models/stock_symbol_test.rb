require 'test_helper'

class StockSymbolTest < ActiveSupport::TestCase
  setup do
    filename = 'stock_symbols.json'
    file_content = file_fixture(filename).read
    @data = JSON.parse(file_content, symbolize_names: true)
  end

  test 'set up' do
    byebug
  end
end
