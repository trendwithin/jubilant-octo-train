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
    assert_content '2 errors prohibited this record from being saved:'
  end

  test 'valid form input' do
    visit new_stock_symbol_path
    fill_in 'stock_symbol[symbol]', with: 'TESTONE'
    fill_in 'stock_symbol[company_name]', with: 'One Two Three'
    find('input[name="commit"]').click
    assert_content 'New Stock Symbol Successfully Added.'
    assert_current_path new_stock_symbol_path
  end

  test '#create fetches historical data' do
    refute StockSymbol.find_by_symbol('WB')
    visit new_stock_symbol_path
    fill_in 'stock_symbol[symbol]', with: 'WB'
    fill_in 'stock_symbol[company_name]', with: 'Weibo Corp'
    find('input[name="commit"]').click
    assert_content 'New Stock Symbol Successfully Added.'
    assert_current_path new_stock_symbol_path
    assert StockSymbol.find_by_symbol('WB')
  end
end
