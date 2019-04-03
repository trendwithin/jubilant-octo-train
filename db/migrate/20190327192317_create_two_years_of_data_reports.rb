class CreateTwoYearsOfDataReports < ActiveRecord::Migration[5.1]
  def change
    create_view :two_years_of_data_reports, materialized: true

    add_index :two_years_of_data_reports, :symbol
    add_index :two_years_of_data_reports, :stock_symbol_id
    add_index :two_years_of_data_reports, :market_close_date
  end
end
