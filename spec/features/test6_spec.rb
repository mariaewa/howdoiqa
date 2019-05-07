require 'rails_helper'

feature 'test 6', js: true do
  before(:each) do
    visit '/pages/test_6'
  end

  context "country doesn't exist" do

    scenario "user doesn't see the country" do
      within(:xpath, "//h2[text()='Subject of test:']/following-sibling::p") do
        expect(page).to have_no_content('Poland')
        expect(page).to have_no_content('PL')
      end
    end
  end

  context "country exists" do
    let!(:country) { create(:country) }

    scenario "user sees the country" do
      binding.pry
      within(:xpath, "//h2[text()='Subject of test:']/following-sibling::p") do
        expect(page).to have_content(country.name)
        expect(page).to have_content(country.code)
      end
    end
  end
end
