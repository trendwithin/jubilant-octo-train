class CreateFirstSixtyThreePeriodNewHighReports < ActiveRecord::Migration[5.1]
  def change
    create_view :first_sixty_three_period_new_high_reports, materialized: true
  end
end
