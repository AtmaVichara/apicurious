class DashboardController < ApplicationController

  def index
    @user = GithubPresenter.new(current_user)
  end

end
