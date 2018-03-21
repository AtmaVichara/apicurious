require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root page" do
    it "shows all content with signup and login button" do
      visit root_path
      stub_omniauth

      click_on "Login to GitHub"
      user = User.first
      binding.pry
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(page).to have_content("AtmaVichara")
    end
  end
end
