FactoryGirl.define do
  factory :internal_post do
    user
    tags {[FactoryGirl.create(:tag)]}
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
  end
end
