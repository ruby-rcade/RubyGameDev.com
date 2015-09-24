require "rails_helper"

describe "Creating Guide Revisons" do
  before do
    @user = create_and_sign_in_user
    @guide = FactoryGirl.create(:guide, title: "Some Guide for Ruby", body_markdown: "RoR")
  end

  it "checks if 'Add Revision' link redirection is true" do
    visit "/posts/#{@guide.id}"

    click_link('Add Revision')
    expect(page.current_path).to eq new_guide_revision_path
  end

  it "creates a new revision and checks if its status is 'pending'" do
    visit new_guide_revision_path(guide_id: @guide.id)

    fill_in("Title", with: "Some Guide for Ruby and Rails")
    fill_in("Body markdown", with: "RoR and Java")

    click_button "Send for Review"

    expect(page).to have_content("Your revision was successfully sent for review.")
    expect(page.current_path).to eq "/guide_revisions"
    expect(page).to have_css ".status-p"

    @guide_revision = GuideRevision.find_by!(original_guide_id: @guide.id)
    @guide.reload

    expect(@guide.title).to eq "Some Guide for Ruby"
    expect(@guide_revision.title).to eq "Some Guide for Ruby and Rails"
  end
end

describe "Editing Guide Revision" do
  before do
    @user = create_and_sign_in_user
    @guide = FactoryGirl.create(:guide)
    @guide_revision = FactoryGirl.create(:guide_revision, user: @user)

    visit "/guide_revisions"
  end

  it "allows user to edits created revision if its status is 'pending'" do
    visit guide_revision_path(@guide_revision.id)
    expect(page).to have_css ".status-p"

    click_link "Edit revision"
    expect(page.current_path).to eq edit_guide_revision_path(@guide_revision.id)
    
    fill_in("Title", with: "Some Revision Guide for Ruby and Rails")
    fill_in("Body markdown", with: "Revision RoR and Java")

    click_button "Update Revision"
    expect(page.current_path).to eq guide_revision_path(@guide_revision.id)

    @guide_revision.reload
    expect(page).to have_content "Your revision was successfully updated."
    expect(@guide_revision.title).to eq "Some Revision Guide for Ruby and Rails"
    expect(@guide_revision.body_markdown).to eq "Revision RoR and Java"
  end

  it "allows the admin to reject 'pending' revisions" do
    sign_out
    sign_in($admin)

    visit guide_revision_path(@guide_revision.id)

    expect(page).to have_link "Reject"
    

    click_link "Reject"
    @guide_revision.reload
    expect(page.current_path).to eq "/guide_revisions"
    expect(@guide_revision.status).to eq "rejected"
  end

  it "allows the admin to approve 'pending' revisions" do
    sign_out
    sign_in($admin)

    visit guide_revision_path(@guide_revision.id)

    expect(page).to have_link "Approve"

    click_link "Approve"
    @guide_revision.reload
    expect(page.current_path).to eq "/guide_revisions"
    expect(@guide_revision.status).to eq "approved"
  end
end
