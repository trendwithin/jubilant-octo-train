require 'test_helper'
require 'minitest/autorun'
class MaintenanceAndErrorsHelperTest < ActionView::TestCase

  test 'helper error logger output' do
    expected = "<h1>File Not Found</h1>\n"
    response = invalid_symbols_error_log('')
    assert_equal expected, response
  end
end
