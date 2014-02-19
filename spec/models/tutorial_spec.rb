require 'spec_helper'

describe Tutorial do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user }

  let(:user){ FactoryGirl.create(:user) }

  describe '#notify_twitter' do
    it 'posts to Twitter after create' do
      tutorial = user.tutorials.new(title: 'This is a test tutorial')
      expect(tutorial).to receive(:notify_twitter)
      tutorial.save!
    end

    it 'sends a Twitter update' do
      subject.title = 'This is a test tutorial'
      subject.user = user
      expect($twitter_client).to receive(:update).with('New Tutorial: This is a test tutorial http://www.rubygamedev.com/tutorials/1')
      subject.save!
    end

    it 'keeps the character limit to 140' do
      pending
    end
  end
end
