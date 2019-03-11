require 'test_helper'

class SiteLinksTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test 'navbar links guest user' do
    get root_path
    assert_select "a[href=?]", new_user_session_path, count: 0
  end

  test 'navbar links admin user' do
    sign_in(@user)
    get root_path
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", daily_high_lows_path
    assert_select "a[href=?]", new_stock_symbol_path
    assert_select "a[href=?]", five_period_leaders_path
    assert_select "a[href=?]", new_price_history_path
    assert_select "a[href=?]", new_tradeable_universe_path
  end
end
