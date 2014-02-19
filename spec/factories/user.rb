FactoryGirl.define do
  # user's are usually created by authenticating with GitHub which calls User.create_from_auth_hash(auth)
  factory :user do
    github_id 123
    username 'exampleusername'
    email 'exampleuser@example.com'
  end
end