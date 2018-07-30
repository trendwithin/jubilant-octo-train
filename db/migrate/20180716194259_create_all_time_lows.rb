class CreateAllTimeLows < ActiveRecord::Migration[5.1]
  def change
    create_table :all_time_lows do |t|
      t.text :symbol
      t.date :market_close_date

      t.timestamps
    end
    add_index :all_time_lows, [:symbol, :market_close_date], unique: true
  end
end
