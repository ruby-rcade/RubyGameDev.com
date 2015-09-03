FactoryGirl.define do
  factory :guide do
    user
    category
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
  end
end