class CreateTradeableUniverses < ActiveRecord::Migration[5.1]
  def change
    create_table :tradeable_universes do |t|
      t.integer :three_month
      t.integer :six_month

      t.timestamps
    end
      add_index :tradeable_universes, [:three_month, :six_month]
  end
end
