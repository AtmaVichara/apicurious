require 'rails_helper'

describe "As a user" do
  context "from the dashboard index" do
    it "show repos" do
      VCR.use_cassette("repos", :record => :new_episodes) do
        # repos         = File.open('./spec/fixtures/repos.json')
        # user          = File.open('./spec/fixtures/github_user.json')
        # starred_repos = File.open('./spec/fixtures/starred_repos.json')
        # stub_request(:get, "https://api.github.com/users/AtmaVichara").
        #    to_return(status: 200, body: user, headers: {})
        # stub_request(:get, "https://api.github.com/users/AtmaVichara/starred").
        #    to_return(status: 200, body: starred_repos, headers: {})
        # stub_request(:get, "https://api.github.com/users/AtmaVichara/repos").
        #    to_return(status: 200, body: repos, headers: {})


        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_index_path

        expect(page).to have_content("activerecord_exploration")
        expect(page).to have_content("apicurious")
        expect(page).to have_content("bike-share")
        expect(page).to have_content("black_thursday")
        expect(page).to have_css(".repo", count: 30)
      end
    end
  end
end
