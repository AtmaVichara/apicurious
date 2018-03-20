class GitHubService

  attr_reader :conn,
              :token

  def initialize(user)
    @token = user.oauth_token
    @user  = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = @token
    end
  end

  def repos
    response = @conn.get("/users/#{@user.nickname}/repo")
    repos = JSON.parse(response.body, :symbolize_names => true)
    repos.map do |repo|
      Repo.new(repo)
    end
  end

end
