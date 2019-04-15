class UpdateFirstTwoHundredFiftyPeriodNewHighReportsToVersion2 < ActiveRecord::Migration[5.1]
  def change
    update_view :first_two_hundred_fifty_period_new_high_reports,
      version: 2,
      revert_to_version: 1,
      materialized: true
  end
end
