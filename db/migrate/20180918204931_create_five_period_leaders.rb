class CreateFivePeriodLeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :five_period_leaders do |t|
      t.integer :positive
      t.integer :negative

      t.timestamps
    end
      add_index :five_period_leaders, [:positive, :negative]
  end
end
