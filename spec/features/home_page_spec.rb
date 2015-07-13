require "rails_helper"

describe "Home page" do
  before do
    visit '/'
  end

  it "has a link redirecting to About page" do
    click_link 'About RubyGameDev.com'
    expect(current_path).to eq '/about'
  end

  it "has a link redirecting to signup page" do
    click_link 'Sign in'
    expect(current_path).to eq '/sign_in'
  end

  context "link to create a new post"
   it "redirecting to the signup page" do
    click_link 'New'
    expect(current_path).to eq '/sign_in'
  end
end