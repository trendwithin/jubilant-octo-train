require 'test_helper'

class DailyHighLowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_high_low = daily_high_lows(:one)
    @user = users(:admin)
  end

  test "should get index for admin user" do
    sign_in(@user)
    get daily_high_lows_url
    assert_response :success
  end

  test "should not get index when not admin role" do
    get daily_high_lows_url
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should get new for admin user" do
    sign_in(@user)
    get new_daily_high_low_url
    assert_response :success
  end

  test "should not get new when not admin role" do
    get new_daily_high_low_url
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should create daily_high_low when admin" do
    sign_in(@user)
    assert_difference('DailyHighLow.count') do
      year_ago = Time.now - 1.year
      post daily_high_lows_url, params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: year_ago, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    end
    assert_redirected_to daily_high_lows_url
  end

  test "should not create daily_high_low when not admin role" do
    assert_difference('DailyHighLow.count', 0) do
      year_ago = Time.now - 1.year
      post daily_high_lows_url, params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: year_ago, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should get edit for admin" do
    sign_in(@user)
    get edit_daily_high_low_url(@daily_high_low)
    assert_response :success
  end

  test "should not get edit when not admin" do
    get edit_daily_high_low_url(@daily_high_low)
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should update daily_high_low when admin user" do
    sign_in(@user)
    patch daily_high_low_url(@daily_high_low), params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: @daily_high_low.market_close_date, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    assert_redirected_to daily_high_lows_url
  end

  test "should not update daily_high_low when not admin user" do
    patch daily_high_low_url(@daily_high_low), params: { daily_high_low: { all_time_high: @daily_high_low.all_time_high, all_time_low: @daily_high_low.all_time_low, fifty_two_week_high: @daily_high_low.fifty_two_week_high, fifty_two_week_low: @daily_high_low.fifty_two_week_low, market_close_date: @daily_high_low.market_close_date, one_month_high: @daily_high_low.one_month_high, one_month_low: @daily_high_low.one_month_low, six_month_high: @daily_high_low.six_month_high, six_month_low: @daily_high_low.six_month_low, three_month_high: @daily_high_low.three_month_high, three_month_low: @daily_high_low.three_month_low, year_to_date_high: @daily_high_low.year_to_date_high, year_to_date_low: @daily_high_low.year_to_date_low } }
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should destroy daily_high_low" do
    sign_in(@user)
    assert_difference('DailyHighLow.count', -1) do
      delete daily_high_low_url(@daily_high_low)
    end

    assert_redirected_to daily_high_lows_url
  end

  test "should not destroy daily_high_low when not admin user" do
    assert_difference('DailyHighLow.count', 0) do
      delete daily_high_low_url(@daily_high_low)
    end

    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end
end
