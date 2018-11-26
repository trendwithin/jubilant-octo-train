require 'test_helper'

class FivePeriodLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @five_period_leader = five_period_leaders(:one)
    @user = users(:admin)
  end

  test "should get index for admin user" do
    sign_in(@user)
    get five_period_leaders_url
    assert_response :success
  end

  test "should not get index when not admin role" do
    get five_period_leaders_url
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should get new for admin user" do
    sign_in(@user)
    get new_five_period_leader_url
    assert_response :success
  end

  test "should not get new when not admin user" do
    get new_five_period_leader_url
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should create five_period_leader" do
    sign_in(@user)
    assert_difference('FivePeriodLeader.count') do
      post five_period_leaders_url, params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    end

    assert_redirected_to five_period_leaders_url
  end

  test "user should not create five_period_leader without admin role" do
    assert_difference('FivePeriodLeader.count', 0) do
      post five_period_leaders_url, params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end


  test "should get edit for admin user" do
    sign_in(@user)
    get edit_five_period_leader_url(@five_period_leader)
    assert_response :success
  end

  test "should not get edit when not admin user" do
    get edit_five_period_leader_url(@five_period_leader)
    assert_response :redirect
  end

  test "should update five_period_leader when admin user" do
    sign_in(@user)
    patch five_period_leader_url(@five_period_leader), params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    assert_redirected_to five_period_leaders_url
  end

  test "should not update five_period_leader when not admin" do
    patch five_period_leader_url(@five_period_leader), params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    assert_response :redirect
    follow_redirect!
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should destroy five_period_leader when admin user" do
    sign_in(@user)
    assert_difference('FivePeriodLeader.count', -1) do
      delete five_period_leader_url(@five_period_leader)
    end

    assert_redirected_to five_period_leaders_url
  end

  test "should not destroy five_period_leader when not admin user" do
    assert_difference('FivePeriodLeader.count', 0) do
      delete five_period_leader_url(@five_period_leader)
    end

    assert_response :redirect
  end
end
