require 'test_helper'

class CurrentUserConcernTest < ActionDispatch::IntegrationTest
  class Dummy < ApplicationController; end

    setup do
      @dummy = Dummy.new
    end

    test '#guest_user' do
      user = @dummy.send(:guest_user)
      user_role = "user"
      assert_equal user_role, user.role
      refute user.admin?
    end

    test 'admin user' do
      admin_user = users(:admin)
      sign_in admin_user
      assert admin_user.admin?
    end
end
