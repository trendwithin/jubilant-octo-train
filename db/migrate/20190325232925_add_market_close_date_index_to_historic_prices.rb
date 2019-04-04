class AddMarketCloseDateIndexToHistoricPrices < ActiveRecord::Migration[5.1]
  def change
    add_index :historic_prices, :market_close_date
  end
end
