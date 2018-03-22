class GithubUser

  attr_reader :username,
              :image,
              :follower_count,
              :name,
              :email,
              :bio

  def initialize(user)
    @username       = user[:login]
    @image          = user[:avatar_url]
    @follower_count = user[:followers]
    @name           = user[:name]
    @email          = user[:email]
    @bio            = user[:bio]
    @location       = user[:location]
    @repo_count     = user[:public_repositories]
  end

end
