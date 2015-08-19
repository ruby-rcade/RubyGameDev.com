require "rails_helper"

describe Post do
  it { should validate_presence_of :title }
  it { should have_and_belong_to_many :tags }
  let(:post) { FactoryGirl.create :external_post }
  let(:post2) { FactoryGirl.create :external_post }

  it "checks if a tag title question already exists in other posts" do
    post.create_question_tag
    post2.create_question_tag
    all_tag_titles = Tag.all.map(&:title)
    expect(all_tag_titles).to match_array ["question"]
  end

  describe "#notify_twitter" do
    subject { FactoryGirl.build(:post) }

    it "posts to Twitter after create" do
      expect(subject).to receive(:notify_twitter)
      subject.save!
    end
  end

  describe "#tweet_content" do
    subject { FactoryGirl.build(:post) }

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
