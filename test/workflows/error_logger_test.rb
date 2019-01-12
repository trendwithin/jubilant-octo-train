require 'test_helper'
require 'minitest/autorun'

class ErrorLoggerTest < ActiveSupport::TestCase
  setup do
    @error_logger = ErrorLogger.new('logs')
  end

  test 'returns log' do
    log = {new_highs: {body: 'Report', from: 'New Highs', error: 'Failure'}}
    logger = ErrorLogger.new(log)
    report = logger.report
    assert_equal report, log
  end

  test '#nil_symbol with single symbol' do
    expected = {symbols_return_nil: ['NIL']}
    @error_logger.nil_symbol 'NIL'
    result = @error_logger.historic_data_errors
    assert_equal expected, result
  end

  test '#nil_symbol with multiple symbols' do
    expected = {symbols_return_nil: ['NIL', 'VAL']}
    @error_logger.nil_symbol 'NIL'
    @error_logger.nil_symbol 'VAL'
    result = @error_logger.historic_data_errors
    assert_equal expected, result
  end

  test '#nil_symbols_report returns :symbols_return_nil' do
    expected = ['NIL']
    @error_logger.nil_symbol 'NIL'
    result = @error_logger.nil_symbols_report
    assert_equal expected, result
  end

  test '#format_prepend_date returns expcted date format' do
    test_date = Date.new(2004, 10, 24)
    expected = test_date.strftime("%m_%d_%Y")
    value = @error_logger.format_prepend_date(test_date)
    assert_equal expected, value
  end

  test 'existence of error log file' do
    file_date = Date.new(2004, 10, 24).strftime("%m_%d_%Y")
    file_name = 'nil_symbol_report.txt'
    file = "#{file_date}_#{file_name}"
    Logger.new(File.join(Rails.root, 'log', 'custom_log', "#{file}"))
    assert @error_logger.error_data_file_exists?(file_date, file_name)
  end

  test 'non-existance of error log file' do
    file_date = Date.new(2004, 10, 24).strftime("%m_%d_%Y")
    file_name = 'nil_symbol_report.txt'
    file = "#{file_date}_#{file_name}"
    refute @error_logger.error_data_file_exists?(file_date, file_name)
  end


  test 'creat error file' do
    file_date = Date.new(2004, 10, 24).strftime("%m_%d_%Y")
    file_name = 'nil_symbol_report.txt'
    @error_logger.create_error_data_file(file_date, file_name)
    assert @error_logger.error_data_file_exists?(file_date, file_name)
  end

  test '#read_file' do
    @error_logger.read_file('file.txt')
    puts
  end

  def teardown
    file_date = Date.new(2004, 10, 24).strftime("%m_%d_%Y")
    file_name = 'nil_symbol_report.txt'
    file = "#{file_date}_#{file_name}"
    path_to_file = File.join(Rails.root, 'log', 'custom_log', "#{file}")
    File.delete(path_to_file) if File.exist?(path_to_file)
  end
end
