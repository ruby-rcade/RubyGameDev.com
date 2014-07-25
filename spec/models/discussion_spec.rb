require 'spec_helper'

describe Discussion do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user }

  # let(:user){ FactoryGirl.create(:user) }

  # describe '#notify_twitter' do
  #   subject do
  #     user.discussions.new(title: 'This is a test discussion', body: 'Discussion body')
  #   end

  #   it 'posts to Twitter after create' do
  #     # discussion = user.discussions.new(title: 'This is a test discussion')
  #     # expect(discussion).to receive(:notify_twitter)
  #     # discussion.save!
  #     expect(subject).to receive(:notify_twitter)
  #     subject.save!
  #   end

  #   it 'includes the title in the tweet' do
  #     # subject.title = 'This is a test discussion'
  #     # subject.user = user
  #     expect($twitter_client).to receive(:update).with 'New Discussion: This is a test discussion http://rbga.me/d/1'
  #     subject.save!
  #   end

  #   it 'uses the short domain for links' do
  #     expect($twitter_client).to receive(:update).with %r{http://rbga.me/d/1}
  #     subject.save!
  #   end

  #   it 'keeps the character limit to 140' do
  #     subject.title = 'a' * 140
  #     # subject.user = user
  #     tweet = "New Discussion: #{'a'*140} http://rbga.me/t/1"
  #     tweet.length.should == 140
  #     expect($twitter_client).to receive(:update).with(tweet)
  #     subject.save!
  #   end
  # end

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
