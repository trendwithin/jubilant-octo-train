require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get thirteen_percent" do
    get charts_view_path
    assert_response :success
  end

end
