require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root page" do
    it "shows all content with signup and login button" do
      visit root_path

      expect(page).to have_css('.login')
      expect(page).to have_css('.signup')
      expect(page).to have_content("Login")
      expect(page).to have_content("Signup")
    end
  end
end
