class AddForeignKeyToHistoricPrices < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :historic_prices, :stock_symbols, column: :stock_symbol_id
  end
end
