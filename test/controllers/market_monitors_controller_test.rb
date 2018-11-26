require 'test_helper'

class MarketMonitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market_monitor = market_monitors(:one)
    @user = users(:admin)
  end

  test "should get index for admin user" do
    sign_in @user
    get market_monitors_url
    assert_response :success
  end

  test "should not get index unless admin user" do
    get market_monitors_url
    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
    #assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should get new for admin user" do
    sign_in(@user)
    get new_market_monitor_url
    assert_response :success
  end

  test "should not get new when not admin user" do
    get new_market_monitor_url
    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should create market_monitor when admin user" do
    sign_in(@user)
    tomorrow = @market_monitor.market_close_date = Time.now - 100.days
    assert_difference('MarketMonitor.count') do
      post market_monitors_url, params:
        { market_monitor:
          { market_close_date: tomorrow,
            up_four_pct_daily: @market_monitor.up_four_pct_daily,
            down_four_pct_daily: @market_monitor.down_four_pct_daily,
            up_twenty_five_pct_quarter: @market_monitor.up_twenty_five_pct_quarter,
            down_twenty_five_pct_quarter: @market_monitor.down_twenty_five_pct_quarter,
            up_twenty_five_pct_month: @market_monitor.up_twenty_five_pct_month,
            down_twenty_five_pct_month: @market_monitor.down_twenty_five_pct_month,
            up_thirteen_pct_six_weeks: @market_monitor.up_thirteen_pct_six_weeks,
            down_thirteen_pct_six_weeks: @market_monitor.down_thirteen_pct_six_weeks,
            up_fifty_pct_month: @market_monitor.up_fifty_pct_month,
            down_fifty_pct_month: @market_monitor.down_fifty_pct_month,
            total_stocks: @market_monitor.total_stocks
          }
        }
    end
    assert_redirected_to market_monitor_url(MarketMonitor.last)
  end

  test "should not create market_monitor when not admin user" do
    tomorrow = @market_monitor.market_close_date = Time.now - 100.days
    assert_difference('MarketMonitor.count', 0) do
      post market_monitors_url, params:
        { market_monitor:
          { market_close_date: tomorrow,
            up_four_pct_daily: @market_monitor.up_four_pct_daily,
            down_four_pct_daily: @market_monitor.down_four_pct_daily,
            up_twenty_five_pct_quarter: @market_monitor.up_twenty_five_pct_quarter,
            down_twenty_five_pct_quarter: @market_monitor.down_twenty_five_pct_quarter,
            up_twenty_five_pct_month: @market_monitor.up_twenty_five_pct_month,
            down_twenty_five_pct_month: @market_monitor.down_twenty_five_pct_month,
            up_thirteen_pct_six_weeks: @market_monitor.up_thirteen_pct_six_weeks,
            down_thirteen_pct_six_weeks: @market_monitor.down_thirteen_pct_six_weeks,
            up_fifty_pct_month: @market_monitor.up_fifty_pct_month,
            down_fifty_pct_month: @market_monitor.down_fifty_pct_month,
            total_stocks: @market_monitor.total_stocks
          }
        }
    end
    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should show market_monitor for admin" do
    sign_in(@user)
    get market_monitor_url(@market_monitor)
    assert_response :success
  end

  test "should not get show market_monitor when not admin" do
    get market_monitor_url(@market_monitor)
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end


  test "should get edit for admin" do
    sign_in(@user)
    get edit_market_monitor_url(@market_monitor)
    assert_response :success
  end

  test "should not get edit when not admin" do
    get edit_market_monitor_url(@market_monitor)
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should update market_monitor for admin" do
    sign_in(@user)
    patch market_monitor_url(@market_monitor), params:
      { market_monitor: { down_fifty_pct_month: @market_monitor.down_fifty_pct_month,
        down_four_pct_daily: @market_monitor.down_four_pct_daily,
        down_thirteen_pct_six_weeks: @market_monitor.down_thirteen_pct_six_weeks,
        down_twenty_five_pct_month: @market_monitor.down_twenty_five_pct_month,
        down_twenty_five_pct_quarter: @market_monitor.down_twenty_five_pct_quarter,
        market_close_date: @market_monitor.market_close_date,
        total_stocks: @market_monitor.total_stocks,
        up_fifty_pct_month: @market_monitor.up_fifty_pct_month,
        up_four_pct_daily: @market_monitor.up_four_pct_daily,
        up_twenty_five_pct_month: @market_monitor.up_twenty_five_pct_month,
        up_thirteen_pct_six_weeks: @market_monitor.up_thirteen_pct_six_weeks,
        up_twenty_five_pct_quarter: @market_monitor.up_twenty_five_pct_quarter }
      }
    assert_redirected_to market_monitor_url(@market_monitor)
  end

  test "should not update market_monitor when not admin" do
    patch market_monitor_url(@market_monitor), params:
      { market_monitor: { down_fifty_pct_month: @market_monitor.down_fifty_pct_month,
        down_four_pct_daily: @market_monitor.down_four_pct_daily,
        down_thirteen_pct_six_weeks: @market_monitor.down_thirteen_pct_six_weeks,
        down_twenty_five_pct_month: @market_monitor.down_twenty_five_pct_month,
        down_twenty_five_pct_quarter: @market_monitor.down_twenty_five_pct_quarter,
        market_close_date: @market_monitor.market_close_date,
        total_stocks: @market_monitor.total_stocks,
        up_fifty_pct_month: @market_monitor.up_fifty_pct_month,
        up_four_pct_daily: @market_monitor.up_four_pct_daily,
        up_twenty_five_pct_month: @market_monitor.up_twenty_five_pct_month,
        up_thirteen_pct_six_weeks: @market_monitor.up_thirteen_pct_six_weeks,
        up_twenty_five_pct_quarter: @market_monitor.up_twenty_five_pct_quarter }
      }
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should destroy market_monitor for admin" do
    sign_in(@user)
    assert_difference('MarketMonitor.count', -1) do
      delete market_monitor_url(@market_monitor)
    end

    assert_redirected_to market_monitors_url
  end

  test "should not destroy market_monitor when not admin" do
    assert_difference('MarketMonitor.count', 0) do
      delete market_monitor_url(@market_monitor)
    end

    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end
end
