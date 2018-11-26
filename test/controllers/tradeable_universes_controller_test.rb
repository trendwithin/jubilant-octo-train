require 'test_helper'

class TradeableUniversesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tradeable_universe = tradeable_universes(:one)
    @user = users(:admin)
  end

  test "should get index for admin" do
    sign_in(@user)
    get tradeable_universes_url
    assert_response :success
  end

  test "should not get index when not admin" do
    get tradeable_universes_url
    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should get new for admin" do
    sign_in(@user)
    get new_tradeable_universe_url
    assert_response :success
  end

  test "should not get new for non-admin" do
    get new_tradeable_universe_url
    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should create tradeable_universe for admin user" do
    sign_in(@user)
    assert_difference('TradeableUniverse.count') do
      post tradeable_universes_url, params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    end

    assert_redirected_to tradeable_universes_url
  end

  test "should not create tradeable_universe for non-admin user" do
    assert_difference('TradeableUniverse.count', 0) do
      post tradeable_universes_url, params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    end

    assert_response :redirect
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "should get edit for admin user" do
    sign_in(@user)
    get edit_tradeable_universe_url(@tradeable_universe)
    assert_response :success
  end

  test "should not get edit for non-admin" do
    get edit_tradeable_universe_url(@tradeable_universe)
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should update tradeable_universe for admin user" do
    sign_in(@user)
    patch tradeable_universe_url(@tradeable_universe), params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    assert_redirected_to tradeable_universes_url
  end

  test "should not update tradeable_universe for non-admin" do
    patch tradeable_universe_url(@tradeable_universe), params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end

  test "should destroy tradeable_universe for admin user" do
    sign_in(@user)
    assert_difference('TradeableUniverse.count', -1) do
      delete tradeable_universe_url(@tradeable_universe)
    end

    assert_redirected_to tradeable_universes_url
  end

  test "should not destroy tradeable_universe for non-admin" do
    assert_difference('TradeableUniverse.count', 0) do
      delete tradeable_universe_url(@tradeable_universe)
    end

    assert_response :redirect
    assert_equal "Oops! Something went wrong. If problem persist email admin", flash[:alert]
  end
end
