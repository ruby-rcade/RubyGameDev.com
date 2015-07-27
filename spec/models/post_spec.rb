require "rails_helper"

describe Post do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }

  # TODO
  # it { should have_field(:title) }
  # it { should have_field(:body_markdown) }
  # it { should have_field(:body_html) }

  it { should validate_presence_of :user }
  it { should validate_presence_of :title }

  describe '#notify_twitter' do
    subject { FactoryGirl.build(:post) }

    it 'posts to Twitter after create' do
      expect(subject).to receive(:notify_twitter)
      subject.save!
    end
  end

  describe '#tweet_content' do
    subject { FactoryGirl.build(:post) }

    it 'includes the title in the tweet' do
      subject.id = '123'
      subject.title = 'This is a test discussion'
      expect(subject.tweet_content).to match /^This is a test discussion/
    end

    it 'uses the short domain for links' do
      subject.id = '123'
      expect(subject.tweet_content).to match %r{http://rbga.me/123$}
    end

    it 'keeps the character limit to 140' do
      subject.id = '123'
      subject.title = 'a' * 140
      expect(subject.tweet_content.length).to eq 140
      expect(subject.tweet_content).to eq "#{'a'*121} http://rbga.me/123"

      subject.id = '1234567890'
      expect(subject.tweet_content.length).to eq 140
      expect(subject.tweet_content).to eq "#{'a'*114} http://rbga.me/1234567890"
    end
  end

  describe "creating tags" do
    before do
      @post = FactoryGirl.create :post
    end

    def post_tag_titles
      @post.tags.map { |tag| tag.title }
    end

    it "can create all of the tags given from the tags_description accessor" do
      @post.tags_description = "ruby, rails, css"
      @post.create_tags_from_description

      expect(post_tag_titles).to match_array ["css", "rails", "ruby"]
    end

    it "normalizes the tags' names" do
      @post.tags_description = " Ruby,  rails,CSS  "
      @post.create_tags_from_description

      expect(post_tag_titles).to match_array ["ruby", "rails", "css"]
    end

    it "generates a unique list of tags" do
      @post.tags_description = "ruby, rails, ruby"
      @post.create_tags_from_description

      expect(post_tag_titles).to match_array ["ruby", "rails"]
    end

    it "completely replaces the list of tags upon update" do
      @post.tags = [FactoryGirl.create(:tag, title: 'ruby')]
      @post.save!
      @post.reload

      expect(post_tag_titles).to match_array ["ruby"]

      @post.tags_description = "rails, css"
      @post.create_tags_from_description

      expect(post_tag_titles).to match_array ["rails", "css"]
    end

    it "checks if a tag title already exest in other posts" do
      @post2 = FactoryGirl.create :post

      @post.tags_description = "ruby, great"
      @post.create_tags_from_description

      @post2.tags_description = "rails, great"
      @post2.create_tags_from_description  
      
      expect(Tag.all.map{|t| t.title}).to match_array ["ruby", "rails", "great"]     
    end
  end
end
