require 'test_helper'
require 'minitest/autorun'

class FetchAllTimeLowTest < ActiveSupport::TestCase
  setup do
    VCR.use_cassette('all_time_lows_test') do
      url = <<~HEREDOC.gsub(/^[\s\t]*|[\s\t]*\n/, '').strip
      https://core-api.barchart.com/v1/quotes/get?lists=stocks.highslows.current.
      lows.alltime.us&fields=symbol%2CsymbolName%2ClastPrice%2CpriceChange%2CpercentChange
      %2ChighPrice%2ClowPrice%2Cvolume%2CtradeTime%2CsymbolCode%2CsymbolType%2ChasOptions
      &meta=field.shortName%2Cfield.type%2Cfield.description&hasOptions=true&raw=1
      HEREDOC

      agent = BarchartApiConnect.new url
      @atl = BarchartDataProcessor.new(agent)
      @atl.run
      @body = @atl.agent.parse_page_response_body_JSON
    end
  end

  test 'response body count' do
    assert_equal 22, @body['data'].count
  end

  test 'all_time_lows count increase' do
    atl = BarchartDataProcessor.new('dummy')
    atl.symbols << ['ATL']
    assert_difference('AllTimeLow.count') do
      atl.process_data AllTimeLow
    end
  end
end
