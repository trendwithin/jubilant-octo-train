class CreateAllTimeHighs < ActiveRecord::Migration[5.1]
  def change
    create_table :all_time_highs do |t|
      t.text :symbol
      t.date :market_close_date

      t.timestamps
    end
    add_index :all_time_highs, [:symbol, :market_close_date], unique: true

  end
end
