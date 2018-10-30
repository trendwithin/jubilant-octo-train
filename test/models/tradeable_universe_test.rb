require 'test_helper'

class TradeableUniverseTest < ActiveSupport::TestCase
  setup do
    @tu = tradeable_universes(:one)
  end

  test 'letters invalid attributes' do
    @tu.three_month = 'A'
    @tu.six_month = 'B'
    refute @tu.valid?
  end

  test 'symbols invalid attributes' do
    @tu.three_month = '-'
    @tu.six_month = '*'
    refute @tu.valid?
  end

  test 'valid' do
    assert @tu.valid?
  end
end
