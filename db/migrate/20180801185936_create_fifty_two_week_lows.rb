class CreateFiftyTwoWeekLows < ActiveRecord::Migration[5.1]
  def change
    create_table :fifty_two_week_lows do |t|
      t.text :symbol
      t.date :market_close_date

      t.timestamps
    end
    add_index :fifty_two_week_lows, [:symbol, :market_close_date], unique: true
  end
end
