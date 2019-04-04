class CreateFirstTwoHundredFiftyPeriodNewHighReports < ActiveRecord::Migration[5.1]
  def change
    create_view :first_two_hundred_fifty_period_new_high_reports, materialized: true
  end
end
