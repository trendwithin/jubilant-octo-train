require 'test_helper'

class IndustryTest < ActiveSupport::TestCase
  setup do
    @industry = industries(:auto)
  end

  test 'attributes valid' do
    assert @industry.valid?
  end
end
