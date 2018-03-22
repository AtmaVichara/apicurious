require 'rails_helper'

describe GitHubService do
  let(:user) { create(:user) }
  subject { GitHubService.new(user) }
  describe "#repos" do
    it "returns all repos" do
      VCR.use_cassette("repo_method", record: :new_episodes) do
        repos = subject.repos

        expect(repos).to be_a Array
        repos.each do |repo|
          expect(repo).to be_a Repo
        end
      end
    end
  end
end
