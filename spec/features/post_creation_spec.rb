require 'rails_helper'

describe "Post creation" do
  before do
    # Create a user
    @user = FactoryGirl.create(:user)
    visit '/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    # Go to posts page
    visit '/posts/new'

    # Fill in form and submit
    fill_in("Title", with: 'Some title')
    fill_in("Body markdown", with: 'Example body')
    fill_in("Tags", with: "ruby, rails")
    click_button 'Create Post'
  end

  it "shows a success message" do
    expect(page).to have_content "Post was successfully created."
  end

  it "creates a new post" do
    expect(Post.exists?(title: 'Some title')).to be_truthy
  end

  it "creates tags for the post" do
    post = Post.last
    tag_titles = post.tags.map(&:title)
    expect(tag_titles).to match_array ["ruby", "rails"]
  end

  it "creates a new tag" do
    expect(Tag.exists?(title: 'ruby')).to be_truthy
  end

  # expect tag to show on index page
  it "checks if tags titles show on index page" do
    visit '/'
    within('.posts') do
      expect(page).to have_content 'ruby'
    end
  end
end

describe "Search form" do
  before do
    visit '/'
  end

  it "checks if a specific word could be find in the post title" do
    @post = FactoryGirl.create(:post, title: 'something about rails')

    fill_in 'Search', with: 'rails'
    
    find('.submit-search').click
    expect(page).to have_content 'something about rails'
  end  

end