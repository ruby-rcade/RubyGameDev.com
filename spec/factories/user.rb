FactoryGirl.define do
  factory :user do
    username 'Mister Example' # display name
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
	