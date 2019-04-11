require 'test_helper'

class NullReportConcernTest < ActionDispatch::IntegrationTest
  class Dummy < ApplicationController; end

  setup do
    @dummy = Dummy.new
  end

  test 'nil' do
    record = nil
    report = @dummy.send(:fresh_new_highs_report, record)
    assert_equal ['No New Highs'], report
  end
end
