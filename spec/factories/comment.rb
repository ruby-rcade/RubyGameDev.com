FactoryGirl.define do
  factory :comment do
    user
    parent { create :post }
  end
end
