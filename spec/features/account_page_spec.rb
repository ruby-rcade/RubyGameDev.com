require 'rails_helper'

describe "Account page" do
  before do
    # Sign in
    @user = create_and_sign_in_user

    # Go to account page
    visit '/account'
  end

  it "allows user to edit his profile" do
    fill_in('Display Name', :with => 'John')
    fill_in('Email', :with => 'user@example.com')
    click_button 'Save'
    expect(page).to have_content "Your information was successfully saved"
  end

  it "saves user's data correctly" do
    @user.digest_subscriber = true
    @user.save!

    fill_in('Display Name', :with => 'John')
    click_button 'Save'
    @user.reload

    expect(@user.username).to eq 'John'
    expect(@user.digest_subscriber).to be true
  end
end
