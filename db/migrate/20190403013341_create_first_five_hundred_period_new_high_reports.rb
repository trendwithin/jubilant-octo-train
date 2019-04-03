class CreateFirstFiveHundredPeriodNewHighReports < ActiveRecord::Migration[5.1]
  def change
    create_view :first_five_hundred_period_new_high_reports, materialized: true
  end
end
