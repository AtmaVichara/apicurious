class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                  = auth_info.uid
      new_user.username             = auth_info.info.name
      new_user.oauth_token          = auth_info.credentials.token
      new_user.oauth_secret_token   = auth_info.credentials.secret
      new_user.nickname             = auth_info.info.nickname
      new_user.image                = auth_info.info.image
    end
  end
end
