require "rails_helper"

describe "Guide Revisons" do
  before do
    @user = create_and_sign_in_user
    @guide = FactoryGirl.create(:guide, title: "Some Guide for Ruby", body_markdown: "RoR")
  end

  it "checks if 'Add Revision' link redirection is true" do
    visit "/posts/#{@guide.id}"

    click_link('Add Revision')
    expect(page.current_path).to eq new_guide_revision_path
  end

  it "creates a new revision" do
    visit new_guide_revision_path(guide_id: @guide.id)

    fill_in("Title", with: "Some Guide for Ruby and Rails")
    fill_in("Body markdown", with: "RoR and Java")

    click_button "Send for Review"

    expect(page).to have_content("Your revision was successfully sent for review.")

    @guide_revision = GuideRevision.find_by!(original_guide_id: @guide.id)
    @guide.reload

    expect(@guide.title).to eq "Some Guide for Ruby"
    expect(@guide_revision.title).to eq "Some Guide for Ruby and Rails"
  end
end