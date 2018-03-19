require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root page" do
    it "shows all content with signup and login button" do
      visit root_path

      expect(page).to have_link("Login to Github")
    end
  end
end
