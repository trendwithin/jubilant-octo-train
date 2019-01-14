require 'test_helper'

class MaintenanceAndErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get invalid_symbols" do
    sign_in users(:admin)
    get maintenance_and_errors_invalid_symbols_url
    assert_response :success
  end

end
