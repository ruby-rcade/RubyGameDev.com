FactoryGirl.define do
  factory :internal_post do
    user
    title 'Example Discussion'
    body_markdown 'Example body. So **strong**.'
  end
end
