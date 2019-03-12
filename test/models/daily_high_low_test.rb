require 'test_helper'

class DailyHighLowTest < ActiveSupport::TestCase
  test 'records returned ordered by desc' do
    values = DailyHighLow.order_by_date_desc
    assert (values.each_cons(2).all? { |a,b| a.market_close_date >= b.market_close_date })
  end
end
