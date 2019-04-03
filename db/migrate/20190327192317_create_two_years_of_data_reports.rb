class CreateTwoYearsOfDataReports < ActiveRecord::Migration[5.1]
  def change
    create_view :two_years_of_data_reports, materialized: true
  end
end
