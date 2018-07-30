class FetchDailyHighLow
  attr_reader :agent, :url
  attr_reader :one_month_high, :one_month_low, :three_month_high, :three_month_low
  attr_reader :six_month_high, :six_month_low, :fifty_two_week_high, :fifty_two_week_low
  attr_reader :ytd_high, :ytd_low, :ath, :atl

  def initialize agent
    @agent = agent
    @url = 'https://www.barchart.com/stocks/highs-lows/summary'
  end

  def connect
    connect_to_page
  end

  def run
    fetch_page_data
    insert_new_high_new_low

  end

  private

  def connect_to_page
    agent.fetch_page_body
  end

  def fetch_page_data
    body = agent.fetch_page_body
    @one_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1m").text.to_i
    @one_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1m").text.to_i
    @three_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=3m").text.to_i
    @three_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=3m").text.to_i
    @six_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=6m").text.to_i
    @six_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=6m").text.to_i
    @fifty_two_week_high =  body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1y").text.to_i
    @fifty_two_week_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1y").text.to_i
    @ytd_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=ytd").text.to_i
    @ytd_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=ytd").text.to_i
    @ath = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=alltime").text.to_i
    @atl = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=alltime").text.to_i
  end

  def insert_new_high_new_low
    DailyHighLow.create!(one_month_high: one_month_high, one_month_low: one_month_low,
      three_month_high: three_month_high, three_month_low: three_month_low,
      six_month_high: six_month_high, six_month_low: six_month_low,
      fifty_two_week_high: fifty_two_week_high, fifty_two_week_low: fifty_two_week_low,
      year_to_date_high: ytd_high, year_to_date_low: ytd_low,
      all_time_high: ath, all_time_low: atl,
      market_close_date: Time.now)
  end
end
