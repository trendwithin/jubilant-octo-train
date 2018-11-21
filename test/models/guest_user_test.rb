require 'test_helper'

class GuestUserTest < ActiveSupport::TestCase
  setup do
    @user = GuestUser.new
  end

  test 'user role' do
    assert_equal 'user', @user.role
  end
end
