FactoryGirl.define do
  factory :guide do
    user
    association :category, factory: :guide_category
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
  end
end