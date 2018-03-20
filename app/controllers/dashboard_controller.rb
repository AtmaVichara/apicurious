class DashboardController < ApplicationController

  def index
    @user = current_user
    @repos = GitHubService.new(current_user).repo
  end

end
