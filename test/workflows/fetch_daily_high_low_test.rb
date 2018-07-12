require 'test_helper'
require 'minitest/autorun'

class FetchDailyHighLowTest < ActiveSupport::TestCase
  attr_reader :body

  setup do
    VCR.use_cassette('daily_high_low_test') do
      url = 'https://www.barchart.com/stocks/highs-lows/summary'
      @api_connection = MechanizeConnect.new(url)
      @body = @api_connection.fetch_page_body
    end
  end

    test 'one month high' do
      one_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1m").text.to_i
      assert_equal 395, one_month_high
    end

    test 'one month low' do
      one_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1m").text.to_i
      assert_equal 321, one_month_low
    end

    test 'three month high' do
      three_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=3m").text.to_i
      assert_equal 277, three_month_high
    end

    test 'three month low' do
      three_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=3m").text.to_i
      assert_equal 131, three_month_low
    end

    test 'six month high' do
      six_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=6m").text.to_i
      assert_equal 194, six_month_high
    end

    test 'six month low' do
      six_month_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=6m").text.to_i
      assert_equal 89, six_month_low
    end

    test '52 week high' do
      fifty_two_week_high =  body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1y").text.to_i
      assert_equal 157, fifty_two_week_high
    end

    test '52 week low' do
      fifty_two_week_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=1y").text.to_i
      assert_equal 58, fifty_two_week_low
    end

    test 'year to date high' do
      ytd_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=ytd").text.to_i
      assert_equal 186, ytd_high
    end

    test 'year to date low' do
      ytd_low = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=ytd").text.to_i
      assert_equal 88, ytd_low
    end

    test 'all time high' do
      ath = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=alltime").text.to_i
      assert_equal 102, ath
    end

    test 'all time low' do
      atl = body.link_with(href: "/stocks/highs-lows/lows?screener=us&timeFrame=alltime").text.to_i
      assert_equal 22, atl
    end

    test 'fetch daily high low saves record' do
      VCR.use_cassette('daily_high_low_function_test') do
        url = 'https://www.barchart.com/stocks/highs-lows/summary'
        api_connection = MechanizeConnect.new(url)
        @daily_high_low = FetchDailyHighLow.new(api_connection)
        @daily_high_low.connect
      end
      assert_difference('DailyHighLow.count') do
        @daily_high_low.run
      end
    end
end
