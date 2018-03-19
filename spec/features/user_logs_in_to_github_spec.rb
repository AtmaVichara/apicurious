require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root page" do
    it "shows all content with signup and login button" do
      stub_omniauth
      visit root_path

      expect(page).to have_link("Login to Github")

      click_on "Login to Github"

      expect(page).to have_content("AtmaVichara")
    end
  end
end
