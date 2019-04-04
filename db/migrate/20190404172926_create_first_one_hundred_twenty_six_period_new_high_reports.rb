class CreateFirstOneHundredTwentySixPeriodNewHighReports < ActiveRecord::Migration[5.1]
  def change
    create_view :first_one_hundred_twenty_six_period_new_high_reports, materialized: true
  end
end
