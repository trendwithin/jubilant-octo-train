require 'test_helper'

class MaterializedViewsControllerTest < ActionDispatch::IntegrationTest

  test "should not get refresh_mat_views when unauthorized user" do
    get materialized_views_refresh_mat_views_url
    assert_response :redirect
  end

  test 'should get refresh_mat_views when signed in' do
    @user = users(:admin)
    sign_in @user
    get materialized_views_refresh_mat_views_url
    assert_response :success
  end

end
