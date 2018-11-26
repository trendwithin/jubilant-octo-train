require "application_system_test_case"

class FivePeriodLeadersTest < ApplicationSystemTestCase
  setup do
    @user = users(:admin)
    sign_in(@user)
  end

  test "visiting the index" do
    visit five_period_leaders_url
    assert_selector "h1", text: "Five Period Leader"
  end

  test 'create five period leader with valid input' do
    visit new_five_period_leader_url
    fill_in 'five_period_leader[positive]', with: 1
    fill_in 'five_period_leader[negative]', with: 1
    find('input[name="commit"]').click
    assert_content 'Five period leader was successfully created.'
    assert current_url, five_period_leaders_path
  end

  test 'create five period leader invalid input' do
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

  test 'destroy five period leader' do
    visit five_period_leaders_url
    record = five_period_leaders(:one)
    path = "td#five_period_leader_#{record.id}"
    count = FivePeriodLeader.count
    within(path) do
      page.accept_confirm do
        click_link 'Destroy'
      end
    end
    assert_content 'Five period leader was successfully destroyed.'
    assert_equal count - 1, FivePeriodLeader.count
  end
end
