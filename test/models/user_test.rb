require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
  end

  test 'admin?' do
    assert_equal true, @admin.admin?
  end
end
