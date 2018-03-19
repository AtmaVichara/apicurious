require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Class Methods" do
    it "creates or updates itself from an oauth hash" do
      auth = {
        provider: "github",
        uid: "12345678910",
        info: {
          email: "jmrjobes@gmail.com",
          first_name: "Joseph",
          last_name: "Jobes"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now
        },
        extra: {
          name: "Joseph Jobes"
        }
      }
      User.from_omniauth(auth)
      user = User.first
      expect(new_user.provider).to eq("github")
      expect(new_user.uid).to eq("12345678910")
      expect(new_user.email).to eq("jmrjobes@gmail.com")
      expect(new_user.first_name).to eq("Joseph")
      expect(new_user.last_name).to eq("Jobes")
      expect(new_user.token).to eq("abcdefg12345")
      expect(new_user.refresh_token).to eq("12345abcdefg")
    end
  end
end
