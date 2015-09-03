require "rails_helper"

describe "Guide pages" do
  before do
    @user = create_and_sign_in_user
    FactoryGirl.create(:guide_category)
    @category_game = FactoryGirl.create(:guide_category, name: "3D Games")
  end

  describe "creation" do
    before do
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

  describe "updating" do
    before do
      @guide = FactoryGirl.create :guide

      visit "/guides/#{@guide.id}/edit"
      select "3D Games" , from: "guide[guide_category_id]"
      fill_in("Title", with: "Some Changed title")
      fill_in("Body markdown", with: "Example for changed body")
      click_button "Update Guide"
    end

    it "updates guide" do
      @guide.reload
      expect(@guide.title).to eq "Some Changed title"
      expect(@guide.body_markdown).to eq "Example for changed body"
      expect(@guide.category).to eq @category_game
    end
  end
end
