FactoryGirl.define do
  # NOTE: we should no longer create posts without specifying 
  # the type. Use :internal_post or :external_post instead.
  #
  # factory :post do
  #   tags { [FactoryGirl.create(:tag)] }
  #   title 'Example Discussion'
  #   body_markdown 'Example body. So **strong**.'
  # end
end
