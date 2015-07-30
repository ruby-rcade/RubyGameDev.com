require "rails_helper"

describe ExternalPost do
  it { is_expected.to validate_uniqueness_of(:external_id) }
end

describe "#username" do
  subject { FactoryGirl.build(:external_post) }

  it "it return username of user_display_name" do
    expect(subject.username).to eq subject.user_display_name
  end
end
