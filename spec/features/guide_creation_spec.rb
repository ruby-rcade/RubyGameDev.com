require "rails_helper"

describe "Guide creation" do
  before do
    # Sign in
    @user = create_and_sign_in_user
    FactoryGirl.create(:guide_category)
    FactoryGirl.create(:guide_category, name: "#3D Games")

    # Go to page
    visit "/guides/new"
    select "Some Category Name" , from: "guide[guide_category_id]"
    fill_in("Title", with: "Some title")
    fill_in("Body markdown", with: "Example body")
    click_button "Create Guide"
  end

  it "creates a new guide" do
    category = GuideCategory.find_by(name: "Some Category Name")

    expect(Guide.exists?(
      title: "Some title",
      body_markdown: "Example body",
      guide_category_id: category.id )).to be_truthy
  end

  it "shows a success mesage" do
    expect(page).to have_content "Guide was successfully created."
  end
end
