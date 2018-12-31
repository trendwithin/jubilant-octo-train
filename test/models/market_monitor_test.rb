require 'test_helper'

class MarketMonitorTest < ActiveSupport::TestCase

  test '#order_by_date_desc' do
    values = MarketMonitor.order_by_date_desc
    assert (values.each_cons(2).all?{|a,b| a.market_close_date <= b.market_close_date})
  end

  test 'monitor returns correct [:name]' do
    values = MarketMonitor.monitor
    expected_name_within = ["Thirteen Pct Up", "Thirteen Pct Down"]
    values.each do |k|
      assert_equal true, expected_name_within.include?(k[:name])
    end
  end

  test 'monitor returns correct [:data]' do
    values = MarketMonitor.monitor
    expected = [[10, 20], [200, 100]]
    data_values = []
    data = values.pluck(:data)
    data.each do |cell|
      data_values.push cell.values
    end

    assert_equal data_values, expected
  end
end
