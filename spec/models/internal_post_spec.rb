require "rails_helper"

describe InternalPost do
  it { should belong_to :user }
  it { should have_many :comments }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body_markdown }

  describe "#username" do
    let(:internal_post) { FactoryGirl.create(:internal_post) }

    it "returns username of user table" do
      expect(internal_post.username).to eq internal_post.user.username
    end
  end
end
