require 'test_helper'

class TradeableUniversesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tradeable_universe = tradeable_universes(:one)
  end

  test "should get index" do
    get tradeable_universes_url
    assert_response :success
  end

  test "should get new" do
    get new_tradeable_universe_url
    assert_response :success
  end

  test "should create tradeable_universe" do
    assert_difference('TradeableUniverse.count') do
      post tradeable_universes_url, params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    end

    assert_redirected_to tradeable_universe_url(TradeableUniverse.last)
  end

  test "should show tradeable_universe" do
    get tradeable_universe_url(@tradeable_universe)
    assert_response :success
  end

  test "should get edit" do
    get edit_tradeable_universe_url(@tradeable_universe)
    assert_response :success
  end

  test "should update tradeable_universe" do
    patch tradeable_universe_url(@tradeable_universe), params: { tradeable_universe: { six_month: @tradeable_universe.six_month, three_month: @tradeable_universe.three_month } }
    assert_redirected_to tradeable_universe_url(@tradeable_universe)
  end

  test "should destroy tradeable_universe" do
    assert_difference('TradeableUniverse.count', -1) do
      delete tradeable_universe_url(@tradeable_universe)
    end

    assert_redirected_to tradeable_universes_url
  end
end
