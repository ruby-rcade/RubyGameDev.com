require 'spec_helper'

describe Discussion do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user }

  describe '#notify_twitter' do
    subject { FactoryGirl.build(:discussion) }

    it 'posts to Twitter after create' do
      expect(subject).to receive(:notify_twitter)
      subject.save!
    end
  end

  describe '#tweet_content' do
    subject { FactoryGirl.build(:discussion) }

    it 'includes the title in the tweet' do
      subject.id = '123'
      subject.title = 'This is a test discussion'
      subject.tweet_content.should match /^New Discussion: This is a test discussion/
    end

    it 'uses the short domain for links' do
      subject.id = '123'
      subject.tweet_content.should match %r{http://rbga.me/d/123$}
    end

    it 'keeps the character limit to 140' do
      subject.id = '123'
      subject.title = 'a' * 140
      subject.tweet_content.length.should == 140
      subject.tweet_content.should == "New Discussion: #{'a'*103} http://rbga.me/d/123"

      subject.id = '1234567890'
      subject.tweet_content.length.should == 140
      subject.tweet_content.should == "New Discussion: #{'a'*96} http://rbga.me/d/1234567890"
    end
  end
end
