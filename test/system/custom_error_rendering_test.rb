require "application_system_test_case"

class CustomErrorRenderingTest < ApplicationSystemTestCase
  test '500' do
    visit "/500"
    assert_content "Oops!"
    assert_content "500"
  end

  test '404' do
    visit "/404"
    assert_content "Oops!"
    assert_content "404"
  end
end
