class Follower

  attr_reader :username

  def initialize(follower_info)
    @username = follower_info[:login]
  end

end
