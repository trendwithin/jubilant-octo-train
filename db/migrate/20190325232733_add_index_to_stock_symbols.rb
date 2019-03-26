class AddIndexToStockSymbols < ActiveRecord::Migration[5.1]
  def change
    add_index :stock_symbols, :symbol
  end
end
