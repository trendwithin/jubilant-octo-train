require "application_system_test_case"

class MarketMonitorsTest < ApplicationSystemTestCase
  setup do
    @user = users(:admin)
    sign_in(@user)
  end
  
  test "visiting the index" do
    visit market_monitors_url

    assert_selector "h1", text: "Market Monitor"
  end

  test 'empty input is invalid' do
    visit new_market_monitor_url
    find('input[name="commit"]').click
    assert_content 'errors prohibited this'
  end

  test 'valid input' do
    visit new_market_monitor_url
    fill_in 'market_monitor[up_four_pct_daily]', with: 1
    fill_in 'market_monitor[down_four_pct_daily]', with: 1
    fill_in 'market_monitor[up_twenty_five_pct_quarter]', with: 1
    fill_in 'market_monitor[down_twenty_five_pct_quarter]', with: 1
    fill_in 'market_monitor[up_thirteen_pct_six_weeks]', with: 1
    fill_in 'market_monitor[down_thirteen_pct_six_weeks]', with: 1
    fill_in 'market_monitor[up_twenty_five_pct_month]', with: 1
    fill_in 'market_monitor[down_twenty_five_pct_month]', with: 1
    fill_in 'market_monitor[up_fifty_pct_month]', with: 1
    fill_in 'market_monitor[down_fifty_pct_month]', with: 1
    fill_in 'market_monitor[total_stocks]', with: 5000
    find('input[name="commit"]').click
    assert_content 'Market monitor was successfully created'
  end
end
