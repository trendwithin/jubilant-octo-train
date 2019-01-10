require 'test_helper'
require 'minitest/autorun'

class ErrorLoggerTest < ActiveSupport::TestCase
  test 'returns log' do
    log = {new_highs: {body: 'Report', from: 'New Highs', error: 'Failure'}}
    logger = ErrorLogger.new(log)
    report = logger.report
    assert_equal report, log
  end

  test '#nil_symbol with single symbol' do
    expected = {symbols_return_nil: ['NIL']}
    error_logger = ErrorLogger.new 'logs'
    error_logger.nil_symbol 'NIL'
    result = error_logger.historic_data_errors
    assert_equal expected, result
  end

  test '#nil_symbol with multiple symbols' do
    expected = {symbols_return_nil: ['NIL', 'VAL']}
    error_logger = ErrorLogger.new 'logs'
    error_logger.nil_symbol 'NIL'
    error_logger.nil_symbol 'VAL'
    result = error_logger.historic_data_errors
    assert_equal expected, result
  end

  test '#nil_symbols_report returns :symbols_return_nil' do
    expected = ['NIL']
    error_logger = ErrorLogger.new 'logs'
    error_logger.nil_symbol 'NIL'
    result = error_logger.nil_symbols_report
    assert_equal expected, result
  end
end
