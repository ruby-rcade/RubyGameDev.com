require "rails_helper"

describe "GuideCategory creation" do
  before do
    # Sign in
    @user = FactoryGirl.create(:user)

    # Go to page
    visit '/guide_categories/new'
    fill_in("Category Name", with: "Something Interesting")
    click_button "Save Category"

  end

  it "shows a success mesage" do
    expect(page).to have_content "Guide Category was successfully created."
  end

  it "creates a new guide category" do
    expect(GuideCategory.exists?(name: "Something Interesting")).to be_truthy
  end
end
