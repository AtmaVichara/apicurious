module OmniAuthHelper

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "123456789",
      info: {
        nickname: "WhatchBout",
        email: "whatchabout@gmail.com",
        name: "WHAT"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now
      },
      extra: {
        name: "Joe"
      }
      })
  end

end
