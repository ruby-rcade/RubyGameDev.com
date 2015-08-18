FactoryGirl.define do
  factory :post do
    tags { [FactoryGirl.create(:tag)] }
    title 'Example Discussion'
    body_markdown 'Example body. So **strong**.'
  end
end
