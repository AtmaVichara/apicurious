require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Class Methods" do
      attr = {provider: "github",
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
            }



    subject { User.from_omniauth(attrs) }

    xit "creates or updates itself from an oauth hash" do
      new_user = User.first
      expect(new_user.uid).to eq("12345678910")
      expect(new_user.email).to eq("jmrjobes@gmail.com")
      expect(new_user.first_name).to eq("Joseph")
      expect(new_user.last_name).to eq("Jobes")
      expect(new_user.token).to eq("abcdefg12345")
      expect(new_user.refresh_token).to eq("12345abcdefg")
    end
  end
end
