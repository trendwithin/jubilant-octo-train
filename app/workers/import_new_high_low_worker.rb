class ImportNewHighLowWorker < ProcessWorker

  def perform
    url = 'https://www.barchart.com/stocks/highs-lows/summary'
    agent = MechanizeConnector.new(url)
    agent.mechanize_connector_fetch_page
    unless agent.page.nil?
      daily_high_low = ProcessDailyHighLow.new(agent.page).run
    end
  end
end
