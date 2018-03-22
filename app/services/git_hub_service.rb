class GitHubService

  def initialize(user)
    @user  = user
  end

  def repos
    response = get_url("/users/#{@user.nickname}/repos")
    response.map do |repository|
      Repo.new(repository)
    end
  end

  def followers
    response = get_url("/users/#{@user.nickname}/followers")
    resposne.map do |follower|
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

  private

    attr_reader :user

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def headers
      {
        "access_token" => user.oauth_token
      }
    end

    def conn
      Faraday.new(url: "https://api.github.com", headers: headers)
    end



end
