require 'rails_helper'

describe "Post creation" do
  before do
    @user = FactoryGirl.create(:user)
    visit '/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    visit '/posts/new'

    fill_in("Title", with: 'Some title')
    fill_in("Body markdown", with: 'Example body')
    fill_in("Tags", with: "ruby, rails")
    click_button 'Create Post'
  end

  xit "shows a success message" do
    expect(page).to have_content "Post was successfully created."
  end

  xit "creates a new post" do
    expect(Post.exists?(title: 'Some title')).to be_truthy
  end

  xit "creates tags for the post" do
    post = Post.last
    tag_titles = post.tags.map(&:title)
    expect(tag_titles).to match_array ["ruby", "rails"]
  end

  xit "creates a new tag" do
    expect(Tag.exists?(title: 'ruby')).to be_truthy
  end

  # expect tag to show on index page
  xit "checks if tags titles show on index page" do
    visit '/'
    within('.posts') do
      expect(page).to have_content 'ruby'
    end
  end
end
