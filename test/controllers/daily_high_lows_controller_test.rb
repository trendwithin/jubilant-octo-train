require 'test_helper'

class DailyHighLowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_high_low = daily_high_lows(:one)
  end

  test "should get index" do
    get daily_high_lows_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_high_low_url
    assert_response :success
  end

  test "should create daily_high_low" do
    assert_difference('DailyHighLow.count') do
      post daily_high_lows_url, params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: @daily_high_low.market_close_date, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    end

    assert_redirected_to daily_high_low_url(DailyHighLow.last)
  end

  test "should show daily_high_low" do
    get daily_high_low_url(@daily_high_low)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_high_low_url(@daily_high_low)
    assert_response :success
  end

  test "should update daily_high_low" do
    patch daily_high_low_url(@daily_high_low), params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: @daily_high_low.market_close_date, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    assert_redirected_to daily_high_low_url(@daily_high_low)
  end

  test "should destroy daily_high_low" do
    assert_difference('DailyHighLow.count', -1) do
      delete daily_high_low_url(@daily_high_low)
    end

    assert_redirected_to daily_high_lows_url
  end
end
