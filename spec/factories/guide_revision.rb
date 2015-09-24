FactoryGirl.define do
  factory :guide_revision do

    user
    guide 
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
  end
end
