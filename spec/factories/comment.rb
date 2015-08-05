FactoryGirl.define do
  factory :comment do
    user
    association :parent, factory: :internal_post
  end
end
