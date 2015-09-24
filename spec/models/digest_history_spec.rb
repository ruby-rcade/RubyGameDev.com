require "rails_helper"

describe DigestHistory do
  describe "#daily_post" do
    let(:digest_history) { FactoryGirl.create(:digest_history) }
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:external_post, created_at: Date.today) }

    it "returns daily posts" do
      expect(digest_history.daily_posts.count).to eql(1)
    end
  end
end