require 'rails_helper'

feature 'test 5', js: true do
  let!(:user) { create(:user) }
  let!(:test5_page) {Test5.new}

  before do
    test5_page.load
  end

  scenario 'logging in' do
    test5_page.user_email.set user.email
    test5_page.user_password.set user.password
    test5_page.checkbox.click
    within('#new_user') do
      click_on('Log in')
    end
    expect(page).to have_content(user.email)
  end

  after do
    expect(page).to have_content('Test #5')
  end
end
