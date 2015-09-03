FactoryGirl.define do
  factory :guide do
    user
    category { FactoryGirl.create :guide_category }
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
  end
end