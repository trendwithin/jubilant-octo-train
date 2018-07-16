require 'test_helper'
require 'minitest/autorun'

class FetchFiftyTwoWeekHighTest < ActiveSupport::TestCase
  setup do
    VCR.use_cassette('fetch_fifty_two_week_high_test') do
      url = <<~HEREDOC.gsub(/^[\s\t]*|[\s\t]*\n/, '').strip
        https://core-api.barchart.com/v1/quotes/get?lists=stocks.highslows.current.highs.1y
        .us&fields=symbol%2CsymbolName%2ClastPrice%2CpriceChange%2CpercentChange%2Cvolume%2
        ChighHits1y%2ChighPercent1y%2ClowPercent1y%2CtradeTime%2CsymbolCode%2CsymbolType%2
        ChasOptions&meta=field.shortName%2Cfield.type%2Cfield.description&hasOptions=true&raw=1
      HEREDOC
      agent = BarchartApiConnect.new url
      @fth = FetchFiftyTwoWeekHigh.new(agent)
      @fth.run
      @body = @fth.agent.parse_page_response_body_JSON

    end
  end

  test 'count of highs meets expected' do
    assert_equal 101, @body['data'].count
  end

  test '#new_highs' do
    ftwh = FetchFiftyTwoWeekHigh.new('dummy')
    ftwh.symbols << ['TESTING']
    assert_difference('FiftyTwoWeekHigh.count') do
      ftwh.new_highs
    end
  end
end
