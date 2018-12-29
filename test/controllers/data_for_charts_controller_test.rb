require 'test_helper'

class DataForChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get thirteen_pct" do
    get data_for_charts_thirteen_percent_url
    assert_response :success
  end

end
