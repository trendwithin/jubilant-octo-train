class CreateStockSymbols < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_symbols do |t|
      t.text :symbol, null: false
      t.text :company_name

      t.timestamps
    end
    add_index :stock_symbols, :symbol, unique: true
  end
end
