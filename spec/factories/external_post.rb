FactoryGirl.define do
  factory :external_post do
    sequence(:external_id) { |n| "00000#{n}" }
    title "Example Discussion"
    body_markdown "Example body. So **strong**."
    user_display_name "Mister Tes"
    source_url "http://gamedev.stackexchange.com/"
  end
end
