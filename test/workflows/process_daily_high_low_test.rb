require 'test_helper'
require 'minitest/autorun'

class ProcessDailyHighLowTest < ActiveSupport::TestCase
  attr_reader :body

  setup do
    VCR.use_cassette('daily_high_low_test') do
      @url = 'https://www.barchart.com/stocks/highs-lows/summary'
      @agent = MechanizeConnector.new(@url)
      @body = @agent.mechanize_connector_fetch_page
    end
  end

  test 'initializes object' do
    agent = dummy_api_hit
    obj = ProcessDailyHighLow.new agent
    assert_equal ProcessDailyHighLow, obj.class
  end

  test 'expectation of #format_record via #fetch_page_body_data' do
    obj = ProcessDailyHighLow.new @body
    obj.send('fetch_page_body_data')
    assert_equal " 100 ", obj.one_month_high
    assert_equal " 63 ", obj.atl
  end

  test '#format_record returns expcted hash' do
    obj = ProcessDailyHighLow.new @body
    obj.send('fetch_page_body_data')
    obj.send('format_record')
    record = { :one_month_high=>" 100 ", :one_month_low=>" 241 ",
               :three_month_high=>" 37 ", :three_month_low=>" 201 ",
               :six_month_high=>" 16 ", :six_month_low=>" 192 ",
               :fifty_two_week_high=>" 5 ", :fifty_two_week_low=>" 167 ",
               :year_to_date_high=>" 5 ", :year_to_date_low=>" 167 ",
               :all_time_high=>" 3 ", :all_time_low=>" 63 "
            }
    assert_equal record, obj.record
  end

  test '#process! cleans values with commas and spaces' do
    obj = ProcessDailyHighLow.new @body
    expected = 10000
    dirty = ' 10,000 '
    value = obj.send('process!', "#{dirty}")
    assert_equal expected, value
  end

  test '#process cleans values of spaces' do
    obj = ProcessDailyHighLow.new @body
    expected = 100
    dirty = ' 100 '
    value = obj.send('process!', "#{dirty}")
    assert_equal expected, value
  end

  test 'one month high' do
    one_month_high = body.link_with(href: "/stocks/highs-lows/highs?screener=us&timeFrame=1m").text.to_i
    assert_equal 100, one_month_high
  end

  test '#insert_new_high_new_low' do
    obj = ProcessDailyHighLow.new @body
    assert_difference('DailyHighLow.count') do
      obj.run
    end
  end

  test 'Continuous Ingetration Sunday Live Hit Check' do
    # Live Hit On Sundays For Potential Weekend Push
    t = Time.now
    if t.sunday?
      url = 'https://www.barchart.com/stocks/highs-lows/summary'
      agent = MechanizeConnector.new(url)
      body = agent.mechanize_connector_fetch_page
      obj = ProcessDailyHighLow.new(body)

      obj.send('fetch_page_body_data')
      obj.send('format_record')
      obj.send('clean_record_data')
      obj.record.each do |k, v|
        assert_equal Integer, v.class
      end
    end
  end
end
