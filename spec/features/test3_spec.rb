require 'rails_helper'

feature 'test 3', js: true do
  let!(:test3_page) {Test3.new}

  before do
    test3_page.load
  end

  scenario 'user clicks first row' do
    first(:xpath, '//table//tr').click
    #test3_page.tabela1.click
    expect(page).to have_css("tr.highlighted")
  end

  scenario 'user clicks second row' do
    all('table tr').last.click
    #test3_page.tabela.last.click
    expect(page).to have_css("tr.highlighted")
  end

  scenario 'both rows are clicked' do
    first(:xpath, '//table//tr').click
    all('table tr').last.click
    expect(page).to have_css("tr.highlighted")
  end
end
