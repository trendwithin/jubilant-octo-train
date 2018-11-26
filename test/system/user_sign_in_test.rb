require "application_system_test_case"

class UserSignInTest < ApplicationSystemTestCase
  test 'valid credential user logs in' do
    visit login_path
    fill_in 'user[email]', with: 'admin@example.com'
    fill_in 'user[password]', with: 'password'
    find('input[name="commit"]').click
    assert_content 'LOG OUT'
  end

  test 'invalid credential user' do
    visit login_path
    fill_in 'user[email]', with: 'fake@example.com'
    fill_in 'user[password]', with: 'password'
    find('input[name="commit"]').click
    refute_content 'LOG OUT'
  end
end
