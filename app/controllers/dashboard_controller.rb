class DashboardController < ApplicationController

  def index
    @user = current_user
    @repos = GitHubService.new(current_user).repos
  end

end
