require 'test_helper'

class MarketMonitorGoogleSheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get market_monitor_google_sheets_index_url
    assert_response :success
  end

end
