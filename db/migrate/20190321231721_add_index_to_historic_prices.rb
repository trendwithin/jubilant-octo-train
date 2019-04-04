class AddIndexToHistoricPrices < ActiveRecord::Migration[5.1]
  def change
    add_index :historic_prices, :stock_symbol_id
  end
end
