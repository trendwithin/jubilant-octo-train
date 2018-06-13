require 'test_helper'

class HistoricPriceTest < ActiveSupport::TestCase
  setup do
    @price = historic_prices(:price)
  end

  test 'valid attributes' do
    assert @price.valid?
  end

  test 'associated stock symbol' do
    assert_equal 'FAKE', @price.stock_symbol.symbol
  end
end
