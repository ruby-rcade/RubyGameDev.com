FactoryGirl.define do
  factory :comment do
    user
    body "hello this is the body of comment"
    association :parent, factory: :internal_post
  end
end
