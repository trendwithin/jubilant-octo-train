namespace :db do
  namespace :populate_test_data do
    desc "Populate Fixture Data From Development Data"
    task create_fixture_data: :environment do
      f = File.new(Rails.root + 'test/fixtures/files/stock_symbols.json', 'w')
      f << JSON.pretty_generate((StockSymbol.limit(2)).as_json)
      f.close

      f = File.new(Rails.root + 'test/fixtures/files/historic_prices.json', 'w')
      f << JSON.pretty_generate((HistoricPrice.limit(2)).as_json)
      f.close

      f = File.new(Rails.root + 'test/fixtures/files/industries.json', 'w')
      f << JSON.pretty_generate((Industry.limit(2)).as_json)
      f.close

      f = File.new(Rails.root + 'test/fixtures/files/sectors.json', 'w')
      f << JSON.pretty_generate((Sector.limit(2)).as_json)
      f.close
    end
  end
end
