require 'rails_helper'

feature 'test 1', js: true do
  let!(:test1_page) {Test1.new}

  before do
    test1_page.load
  end

  scenario "click on the right button" do
    test1_page.right_button.click
  end

  scenario 'find content' do
    page.has_content?('Test #2')
  end
end
