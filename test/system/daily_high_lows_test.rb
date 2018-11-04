require "application_system_test_case"

class DailyHighLowsTest < ApplicationSystemTestCase
  test 'page' do
    visit new_daily_high_low_path
    assert :success
  end

  test 'empty fields errors out' do
    visit new_daily_high_low_path
    find('input[name="commit"]').click
    assert_content 'New Daily High Low 12 errors prohibited this daily_high_low from being saved:'
  end

  test 'valid form input' do
    visit new_daily_high_low_path
    fill_in 'daily_high_low[one_month_high]', with: 1
    fill_in 'daily_high_low[one_month_low]', with: 1
    fill_in 'daily_high_low[three_month_high]', with: 1
    fill_in 'daily_high_low[three_month_low]', with: 1
    fill_in 'daily_high_low[six_month_high]', with: 1
    fill_in 'daily_high_low[six_month_low]', with: 1
    fill_in 'daily_high_low[fifty_two_week_high]', with: 1
    fill_in 'daily_high_low[fifty_two_week_low]', with: 1
    fill_in 'daily_high_low[all_time_high]', with: 1
    fill_in 'daily_high_low[all_time_low]', with: 1
    fill_in 'daily_high_low[year_to_date_high]', with: 1
    fill_in 'daily_high_low[year_to_date_low]', with: 1
    find('input[name="commit"]').click

    assert_content 'Daily high low was successfully created.'
  end

  test 'duplicate date errors out' do
    visit new_daily_high_low_path
    fill_in 'daily_high_low[one_month_high]', with: 1
    fill_in 'daily_high_low[one_month_low]', with: 1
    fill_in 'daily_high_low[three_month_high]', with: 1
    fill_in 'daily_high_low[three_month_low]', with: 1
    fill_in 'daily_high_low[six_month_high]', with: 1
    fill_in 'daily_high_low[six_month_low]', with: 1
    fill_in 'daily_high_low[fifty_two_week_high]', with: 1
    fill_in 'daily_high_low[fifty_two_week_low]', with: 1
    fill_in 'daily_high_low[all_time_high]', with: 1
    fill_in 'daily_high_low[all_time_low]', with: 1
    fill_in 'daily_high_low[year_to_date_high]', with: 1
    fill_in 'daily_high_low[year_to_date_low]', with: 1
    select('2018', from: 'daily_high_low[market_close_date(1i)]').click
    select('July', from: 'daily_high_low[market_close_date(2i)]').click
    select('9', from: 'daily_high_low[market_close_date(3i)]').click
    find('input[name="commit"]').click

    assert_content 'Market close date has already been taken'
  end

  test 'update daily high low record' do
    record = daily_high_lows(:one)
    visit edit_daily_high_low_path(record)
    # byebug
    assert_content 'Editing Daily High Low'
    fill_in 'daily_high_low[one_month_high]', with: 2
    find('input[name="commit"]').click
    assert_content 'Daily high low was successfully updated.'
    assert current_url, daily_high_lows_path
  end
end
