require "rails_helper"

describe "Vote creating" do
  before do
    # Sign in
    @user = create_and_sign_in_user
    @post = FactoryGirl.create(:post)

    # Go to account page
    visit '/'
  end

  it "allows user to vote on a certain post" do
    find('.vote-count a').click
    expect(page).to have_content 'You have successfully voted'
  end

  it "doesn't allow user to vote again on the same post" do
    find('.vote-count a').click
    expect(page).not_to have_css('.vote-count a')
  end
end
