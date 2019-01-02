require 'test_helper'

class HistoricPriceTest < ActiveSupport::TestCase
  setup do
    @price = historic_prices(:price)
    @aapl_price = historic_prices(:aapl_price)
  end

  test 'valid attributes' do
    assert @price.valid?
  end

  test 'associated stock symbol' do
    assert_equal 'FAKE', @price.stock_symbol.symbol
  end

  test 'empty when no record created today' do
    expected = 0
    @price.update(created_at: Time.now - 1.day)
    @aapl_price.update(created_at: Time.now - 1.day)
    assert_equal expected, HistoricPrice.todays_records.count
  end

  test 'retrieves todays records' do
    expected = 2
    assert_equal expected, HistoricPrice.todays_records.count
  end

  test 'retrieves ordered records desc' do
    records = HistoricPrice.date_desc(2)
    first_record = records.first
    last_record = records.last
    assert_equal "2018-05-10", first_record.market_close_date.strftime('%Y-%m-%d')
    assert_equal "2017-05-10", last_record.market_close_date.strftime('%Y-%m-%d')
  end
end
