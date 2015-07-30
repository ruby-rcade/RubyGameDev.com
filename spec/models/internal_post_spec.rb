require "rails_helper"

describe InternalPost do
  it { should belong_to :user }
  it { should have_many :comments }

  # TODO
  # it { should have_field(:title) }
  # it { should have_field(:body_markdown) }
  # it { should have_field(:body_html) }

  it { should validate_presence_of :user }
  it { should validate_presence_of :title }

  describe "#notify_twitter" do
    subject { FactoryGirl.build(:internal_post) }

    it "posts to Twitter after create" do
      expect(subject).to receive(:notify_twitter)
      subject.save!
    end
  end

  describe "#username" do
    subject { FactoryGirl.build(:internal_post) }

    it "returns username of user table" do
      expect(subject.username).to eq subject.user.username
    end
  end

  describe "#tweet_content" do
    subject { FactoryGirl.build(:internal_post) }

    it "includes the title in the tweet" do
      subject.id = "123"
      subject.title = "This is a test discussion"
      expect(subject.tweet_content).to match /^This is a test discussion/
    end

    it "uses the short domain for links" do
      subject.id = "123"
      expect(subject.tweet_content).to match %r{http://rbga.me/123$}
    end

    it "keeps the character limit to 140" do
      subject.id = "123"
      subject.title = "a" * 140
      expect(subject.tweet_content.length).to eq 140
      expect(
        subject.tweet_content
      ).to eq "#{'a' * 121} http://rbga.me/123"

      subject.id = "1234567890"
      expect(subject.tweet_content.length).to eq 140
      expect(
        subject.tweet_content
      ).to eq "#{'a' * 114} http://rbga.me/1234567890"
    end
  end
end
