FactoryGirl.define do
  factory :external_post do
    sequence(:external_id) { |n| "1#{n}" }
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
    user_display_name "Mister Tes"
    source_url "http://gamedev.stackexchange.com/"
    created_at "2015-09-07"
  end
end
