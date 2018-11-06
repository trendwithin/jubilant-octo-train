require 'test_helper'

class FivePeriodLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @five_period_leader = five_period_leaders(:one)
  end

  test "should get index" do
    get five_period_leaders_url
    assert_response :success
  end

  test "should get new" do
    get new_five_period_leader_url
    assert_response :success
  end

  test "should create five_period_leader" do
    assert_difference('FivePeriodLeader.count') do
      post five_period_leaders_url, params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    end

    assert_redirected_to five_period_leaders_url
  end


  test "should get edit" do
    get edit_five_period_leader_url(@five_period_leader)
    assert_response :success
  end

  test "should update five_period_leader" do
    patch five_period_leader_url(@five_period_leader), params: { five_period_leader: { negative: @five_period_leader.negative, positive: @five_period_leader.positive } }
    assert_redirected_to five_period_leaders_url
  end

  test "should destroy five_period_leader" do
    assert_difference('FivePeriodLeader.count', -1) do
      delete five_period_leader_url(@five_period_leader)
    end

    assert_redirected_to five_period_leaders_url
  end
end
