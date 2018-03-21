require 'rails_helper'

describe "As a user" do
  context "from the dashboard index" do
    xit "shows repos" do
      visit root_path
      stub_omniauth

      click_on "Login to GitHub"
      user = User.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(page).to have_content()
    end
  end
end
