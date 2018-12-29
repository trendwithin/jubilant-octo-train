class ProcessDailyHighLow
  attr_reader :body, :record
  attr_reader :one_month_high, :one_month_low, :three_month_high, :three_month_low
  attr_reader :six_month_high, :six_month_low, :fifty_two_week_high, :fifty_two_week_low
  attr_reader :ytd_high, :ytd_low, :ath, :atl

  def initialize page_body
    @body = page_body
  end

  def run
    fetch_page_body_data
    format_record
    clean_record_data
    insert_new_high_new_low
  end

  private

  def format_record
    @record =
      { one_month_high: one_month_high, one_month_low: one_month_low,
        three_month_high: three_month_high, three_month_low: three_month_low,
        six_month_high: six_month_high, six_month_low: six_month_low,
        fifty_two_week_high: fifty_two_week_high, fifty_two_week_low: fifty_two_week_low,
        year_to_date_high: ytd_high, year_to_date_low: ytd_low,
        all_time_high: ath, all_time_low: atl
      }
  end

  def clean_record_data
    record.update(record) do |k,v|
      process!(v)
    end
  end

  def process! value
    if value.include?(',')
      value.gsub!(/[\s,]/,'').to_i
    else
      value.strip.to_i
    end
  end

  def fetch_page_body_data
    @one_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1m").text
    @one_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1m").text
    @three_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=3m").text
    @three_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=3m").text
    @six_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=6m").text
    @six_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=6m").text
    @fifty_two_week_high =  body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1y").text
    @fifty_two_week_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1y").text
    @ytd_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=ytd").text
    @ytd_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=ytd").text
    @ath = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=alltime").text
    @atl = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=alltime").text
  end

  def insert_new_high_new_low
    record[:market_close_date] = Time.now
    DailyHighLow.create!(record)
  end
end
