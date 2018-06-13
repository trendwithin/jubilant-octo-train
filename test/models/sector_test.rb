require 'test_helper'

class SectorTest < ActiveSupport::TestCase
  setup do
    @sector = sectors(:hardware)
  end

  test 'valid attributes' do
    assert @sector.valid?
  end
end
