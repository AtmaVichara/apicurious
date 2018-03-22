class GithubPresenter

  def initialize(user)
    @user = user
  end

  def repos
    GitHubService.new(@user).repos
  end

  def github_user
    GitHubService.new(@user).github_user(@user[:nickname])
  end

  def followers
    GitHubService.new(@user).followers
  end

  def starred_repos
    GitHubService.new(@user).starred_repos
  end

  def user_activity
    GitHubService.new(@user).user_activity
  end

  def followers_activity
    GitHubService.new(@user).followers_activity
  end

end
