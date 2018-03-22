require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root page" do
    it "shows all content with signup and login button and logout" do
      VCR.use_cassette("login", :record => :new_episodes) do
        visit root_path
        stub_omniauth


        click_on "Login to GitHub"
        user = User.first
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        expect(page).to have_content("Joseph Jobes")

        click_on "Log Out"

        expect(page).to have_link("Login to GitHub")
      end
    end
  end
end
