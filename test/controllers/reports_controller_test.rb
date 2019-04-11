require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # https://github.com/scenic-views/scenic/issues/133
    ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW first_sixty_three_period_new_high_reports;")
    ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW first_one_hundred_twenty_six_period_new_high_reports;")
    ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW first_two_hundred_fifty_period_new_high_reports;")
    ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW first_five_hundred_period_new_high_reports;")
  end

  test "should get new_highs" do
    get reports_fresh_new_highs_url
    assert_response :success
  end
end
