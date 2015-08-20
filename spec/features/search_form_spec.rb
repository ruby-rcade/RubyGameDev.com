require 'rails_helper'

describe "Search form" do
  before do
    visit '/'
  end

  it "checks if a specific word can be found in the posts title" do
    @post = FactoryGirl.create(:internal_post, title: 'something about rails')
    fill_in 'Search', with: 'rails'
    find('.submit-search').click
    expect(page).to have_content 'something about rails'
  end
end
