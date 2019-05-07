require 'rails_helper'

feature 'test 0', js: true do
  let!(:test0_page) {Test0.new}

  before do
    test0_page.load
  end

  scenario "visit page's url and check content" do
    expect(page).to have_content('Test #0')
    test0_page.next_button.click
    expect(page).to have_content('Test #1')
  end
end
