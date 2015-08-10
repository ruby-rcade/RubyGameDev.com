require "rails_helper"

describe "Home page" do
  before do
    visit '/'
  end

  it "has a link redirecting to About page" do
    click_link 'About RubyGameDev.com'
    expect(current_path).to eq '/about'
  end

  it "has a link redirecting to sign in page" do
    click_link 'Sign in'
    expect(current_path).to eq '/sign_in'
  end

  it "has a link to create a new post which redirects to the sign in page" do
    click_link 'New'
    expect(current_path).to eq '/sign_in'
  end
end
