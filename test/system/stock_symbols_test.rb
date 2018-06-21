require "application_system_test_case"

class StockSymbolsTest < ApplicationSystemTestCase
  test 'page' do
    visit new_stock_symbol_path
    assert_selector 'h1', text: 'Add Symbol'
    assert :success
  end

  test 'Invalid Input' do
    visit new_stock_symbol_path
    find('input[name="commit"]').click
    assert_content '2 errors prohibited this article from being saved:'
  end

  test 'valid form input' do
    visit new_stock_symbol_path
    fill_in 'stock_symbol[symbol]', with: 'TESTONE'
    fill_in 'stock_symbol[company_name]', with: 'One Two Three'
    find('input[name="commit"]').click
    assert_content 'New Stock Symbol Successfully Added.'
  end

  test '#create returns listed entry' do
    visit new_stock_symbol_path
    fill_in 'stock_symbol[symbol]', with: 'ATEST'
    fill_in 'stock_symbol[company_name]', with: 'Testing ATEST'
    find('input[name="commit"]').click
    assert_current_path new_stock_symbol_path
  end
end
