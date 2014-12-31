FactoryGirl.define do
  factory :post do
    user
    title 'Example Discussion'
    body_markdown 'Example body. So **strong**.'
  end
end
