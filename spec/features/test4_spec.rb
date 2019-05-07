require 'rails_helper'

feature 'test 4', js: true do
  let!(:test4_page) {Test4.new}

  before do
    test4_page.load
  end

  scenario 'check if updates' do
    test4_page.ajax_btn.click
    expect(page).to have_content("This is answer from the server")
  end
end
