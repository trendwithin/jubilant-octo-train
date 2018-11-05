require "application_system_test_case"

class FivePeriodLeadersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit five_period_leaders_url
    assert_selector "h1", text: "Five Period Leader"
  end

  test 'valid input' do
    visit new_five_period_leader_url
    fill_in 'five_period_leader[positive]', with: 1
    fill_in 'five_period_leader[negative]', with: 1
    find('input[name="commit"]').click
    assert_content 'Five period leader was successfully created.'
    assert current_url, five_period_leaders_path
  end

  test 'invalid input' do
    visit new_five_period_leader_url
    find('input[name="commit"]').click
    assert_content '2 errors prohibited'
    assert_content "Positive can't be blank Negative can't be blank"
  end

  test 'update five_period_leader' do
    record = five_period_leaders(:one)
    visit edit_five_period_leader_url(record)
    assert_content 'Editing Five Period Leader'
    fill_in 'five_period_leader[positive]', with: 2
    find('input[name="commit"]').click
    assert_content 'Five period leader was successfully updated'
    assert current_url, five_period_leaders_path
  end
end
