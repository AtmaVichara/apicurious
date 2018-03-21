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

  def repo
    response = @conn.get("/users/#{@user.nickname}/repos")
    repositories = JSON.parse(response.body, :symbolize_names => true)
    repositories.map do |repo|
      Repo.new(repo)
    end
  end

  private

    # def generate_repos(repo_count)
    #   if repo_count % 10 == 0
    #     @conn.get("/users/#{@user.nickname}/repos")
    #   else
    #     pages = repo_count % 10
    #     (1..page).to_a.map do |page|
    #       @conn.get("/users/#{@user.nickname}/repos?per_page=100&page=#{page}")
    #     end
    #   end
    # end
    #
    # def generate_multiple_responses(responses)
    #   responses.map do |response|
    #     JSON.parse(response.body, :symbolize_names => true)
    #   end
    # end

end
