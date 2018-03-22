require 'rails_helper'

describe "as a user" do
  context "from the dashboard view" do
    it "shows all counts for the repos, followers, and following" do
      VCR.use_cassette("counts", :record => :new_episodes) do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_index_path

        expect(page).to have_content("Repositories 41")
      end
    end
  end
end
