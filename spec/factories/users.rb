FactoryBot.define do
  factory :user do
    username "Joseph Jobes"
    uid "MyString"
    oauth_token ENV["ACCESS_TOKEN"]
    nickname "AtmaVichara"
    image "https://avatars1.githubusercontent.com/u/7635493?v=4"
    bio "Software Developer attending Turing\r\n@JosephJobes on slack"  
  end
end
