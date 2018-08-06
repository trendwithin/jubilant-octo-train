require 'test_helper'
require 'minitest/autorun'

class ErrorLoggerTest < ActiveSupport::TestCase
  test 'returns log' do
    log = {new_highs: {body: 'Report', from: 'New Highs', error: 'Failure'}}
    logger = ErrorLogger.new(log)
    report = logger.report
    assert_equal report, log
  end
end
