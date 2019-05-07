require 'rails_helper'

feature 'test 2', js: true do
  let!(:test2_page) {Test2.new}

  before do
    test2_page.load
  end

  scenario "submit form" do
    test2_page.textfield.set 'Maria'
    test2_page.checkbox.click
    test2_page.select.set "Opt 1"
    test2_page.radio_button.click
    click_on "Submit"
    page.has_content?('Submitted text: Maria')
    page.has_content?('Checkbox checked: 1')
    page.has_content?('Select option picked: Opt 2')
    page.has_content?('Radio option picked: opt 2')
    page.has_content?('Submitted successfully')
  end

  scenario "submit not completed form" do
    click_on "Submit"
    page.has_content?('Some data was missing')
  end

  scenario 'empty form' do
    page.has_content?('Data will appear here after submission.')
  end
end
