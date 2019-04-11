require 'test_helper'

class MaterializedViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get refresh_mat_views" do
    get materialized_views_refresh_mat_views_url
    assert_response :success
  end

end
