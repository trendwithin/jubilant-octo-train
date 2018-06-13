require 'test_helper'

class StockSymbolTest < ActiveSupport::TestCase
  setup do
    filename = 'stock_symbols.json'
    file_content = file_fixture(filename).read
    @data = JSON.parse(file_content, symbolize_names: true)
    @stock_symbol = stock_symbols(:fake)
  end

  test 'valid attributes' do
    assert @stock_symbol.valid?
  end

  test 'associated industry' do
    assert_equal 'Auto Industry', @stock_symbol.industry.name
  end

  test 'associated sector' do
    assert_equal 'Auto Manufacturing', @stock_symbol.sector.name
  end
end
