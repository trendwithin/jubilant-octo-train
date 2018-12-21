require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get thirteen_percent" do
    get charts_thirteen_percent_url
    assert_response :success
  end

end
