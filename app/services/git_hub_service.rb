class GitHubService

  def initialize(user)
    @user  = user
    @date  = (Date.today - 14).strftime('%Y-%m-%d')
  end

  def repos
    response = get_url("/users/#{@user.nickname}/repos")
    response.map do |repository|
      Repo.new(repository)
    end
  end

  def followers
    response = get_url("/users/#{@user.nickname}/followers")
    response.map do |follower|
      Follower.new(follower)
    end
  end

  def organizaitons
    response = get_url("/users/#{@user.nickname}/orgs")
    resposne.map do |org|
      Organization.new(org)
    end
  end

  def github_user(user)
    response = get_url("/users/#{user}")
    GithubUser.new(response)
  end

  def starred_repos
    response = get_url("/users/#{@user.nickname}/starred")
    response.map do |starred|
      StarredRepos.new(starred)
    end
  end

  def followers_activity
    get_followers_activity_json.map do |activity|
      FollowerActivity.new(activity)
    end
  end

  def user_activity
    activity = get_url("/users/#{@user.nickname}/events")
    activity.map do |act|
      UserActivity.new(act)
    end
  end

  private

    attr_reader :user

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def headers
      {
        "authorization" => "token " + user.oauth_token
      }
    end

    def conn
      Faraday.new(url: "https://api.github.com", headers: headers)
    end

    def get_followers_activity
      followers.map do |follower|
        JSON.parse(get_activity(follower), symbolize_names: true)[:items]
      end.reject(&:empty?)
    end

    def get_followers_activity_json
      followers.map do |follower|
        get_url("/users/#{follower.username}/events")
      end.flatten
    end

end
