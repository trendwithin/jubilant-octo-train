namespace :db do
  namespace :market_monitor_data do
    desc "Populate Market Monitor Data from /db/data_files"
    task insert_data: :environment do
      f = File.open(Rails.root + 'db/data_files/marketmonitor.csv', 'r')
      f.each_line do |line|
        split_line = line.split(',')
        input_date = split_line[0].to_date
        up_four_pct_daily = split_line[1].to_i
        down_four_pct_daily = split_line[2].to_i
        up_twenty_five_pct_quarter = split_line[3].to_i
        down_twenty_five_pct_quarter = split_line[4].to_i
        up_twenty_five_pct_month = split_line[5].to_i
        down_twenty_five_pct_month = split_line[6].to_i
        up_thirteen_pct_six_weeks = split_line[7].to_i
        down_thirteen_pct_six_weeks = split_line[8].to_i
        up_fifty_pct_month = split_line[9].to_i
        down_fifty_pct_month = split_line[10].to_i
        total_stocks = split_line[11].to_i

        mm = MarketMonitor.new(
          market_close_date: input_date,
          up_four_pct_daily: up_four_pct_daily,
          down_four_pct_daily: down_four_pct_daily,
          up_twenty_five_pct_quarter: up_twenty_five_pct_quarter,
          down_twenty_five_pct_quarter: down_twenty_five_pct_quarter,
          up_twenty_five_pct_month: up_twenty_five_pct_month,
          down_twenty_five_pct_month: down_fifty_pct_month,
          up_thirteen_pct_six_weeks: up_thirteen_pct_six_weeks,
          down_thirteen_pct_six_weeks: down_thirteen_pct_six_weeks,
          up_fifty_pct_month: up_fifty_pct_month,
          down_fifty_pct_month: down_fifty_pct_month,
          total_stocks: total_stocks
        )
        mm.save!
      end
      f.close
    end
  end
end
