module OmniAuthHelper

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
          uid: "12345678910",
          info: {
            email: "jmrjobes@gmail.com",
            nickname: "AtmaVichara",
            name: 'Joseph Jobes',
            image: "something.png"
          },
          credentials: {
            token: "abcdefg12345",
            secret: "12345abcdefg",
            expires_at: DateTime.now
          },
          extra: {
            raw_info: {
              bio: "Let it be",
              public_repos: '43'
            }
          }
      })
  end

end
