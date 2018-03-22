require "rails_helper"

describe "as a user" do
  context "from the dashboard" do
    it "shows the followers events" do
      VCR.use_cassette("followers events", record: :new_episodes) do

        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_index_path

        expect(page).to have_css(".follower-event", count: 132)
      end
    end
  end
end
