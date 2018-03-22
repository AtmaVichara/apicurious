class GithubUser

  attr_reader :username,
              :image,
              :follower_count,
              :name,
              :email,
              :bio,
              :repo_count,
              :following,
              :gist_count,
              :location

  def initialize(user)
    @username       = user[:login]
    @image          = user[:avatar_url]
    @follower_count = user[:followers]
    @name           = user[:name]
    @email          = user[:email]
    @bio            = user[:bio]
    @location       = user[:location]
    @repo_count     = user[:public_repos]
    @gist_count     = user[:public_gists]
    @following      = user[:following]
  end

end
