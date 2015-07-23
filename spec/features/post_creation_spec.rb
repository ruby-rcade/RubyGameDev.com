require 'rails_helper'

describe "Post creation" do
  before do
    # Sign in
    @user = User.create!(username: 'Larry', email: 'user@example.com', password: 'password', digest_subscriber: 'true')
    visit '/sign_in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    # Go to posts page
    visit '/posts/new'

    # Fill in form and submit
    fill_in("Title", with: 'Some title')
    fill_in("Body markdown", with: 'Example body')
    #fill_in 'Tags', with: 'Some tag title'
    click_button 'Create Post'
  end

  it "shows a success message" do
    expect(page).to have_content "Post was successfully created."
  end

  it "creates a new post" do
    expect(Post.exists?(title: 'Some title')).to be_truthy
  end

  # it "creates a new tag" do
  #   expect(Tags.exists?(title: 'Some tag title')).to be_truthy
  # end
end
