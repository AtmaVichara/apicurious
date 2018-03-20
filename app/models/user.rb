class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = User.find_by(uid: auth_info[:uid]) || User.new
    user.attributes = {
      uid: auth_info[:uid],
      username: auth_info[:info][:name],
      oauth_token: auth_info[:credentials][:token],
      oauth_secret_token: auth_info[:credentials][:secret],
      nickname: auth_info[:info][:nickname],
      image: auth_info[:info][:image],
      bio: auth_info[:extra][:raw_info][:bio],
      repos: auth_info[:extra][:raw_info][:public_repos]
    }
    user.save!
    user
  end
end
