class ImportNewHighLowWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    url = 'https://www.barchart.com/stocks/highs-lows/summary'
    api_connection = MechanizeConnector.new(url)
    daily_high_low = FetchDailyHighLow.new(api_connection)
    daily_high_low.connect
    daily_high_low.run
  end
end
