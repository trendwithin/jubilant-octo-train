require "application_system_test_case"

class TradeableUniversesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit tradeable_universes_url
    assert_selector "h1", text: "Tradeable Universe"
  end

  test 'insert empty input' do
    visit new_tradeable_universe_url
    find('input[name="commit"]').click
    assert_content '4 errors prohibited this tradeable_universe from being saved:'
  end

  test 'invalid input' do
    visit new_tradeable_universe_url
    fill_in 'tradeable_universe[three_month]', with: 'A'
    fill_in 'tradeable_universe[six_month]', with: '-'
    find('input[name="commit"]').click
    assert_current_path new_tradeable_universe_path
  end

  test 'valid input' do
    visit new_tradeable_universe_url
    fill_in 'tradeable_universe[three_month]', with: 6
    fill_in 'tradeable_universe[six_month]', with: 5
    find('input[name="commit"]').click
    assert_content 'Tradeable universe was successfully created.'
  end

  test 'delete tradeable universe record' do
    visit tradeable_universes_url
    record = tradeable_universes(:one)
    path = "td#tradeable_universe_#{record.id}"
    byebug
    within(path) do
      page.accept_confirm do
        click_link 'Destroy'
      end
    end
    assert_content 'Tradeable universe was successfully destroyed.'
  end
end
