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

  describe "creating tags" do
    before do
      @post = FactoryGirl.create :internal_post
    end

    def post_tag_titles
      @post.tags.map(&:title)
    end

    it "can create all of the tags given from the tags_string accessor" do
      @post.tags_string = "ruby, rails, css"
      @post.create_tags_from_tag_string

      expect(post_tag_titles).to match_array ["css", "rails", "ruby"]
    end

    it "normalizes the tags' names" do
      @post.tags_string = " Ruby,  rails,CSS  "
      @post.create_tags_from_tag_string

      expect(post_tag_titles).to match_array ["ruby", "rails", "css"]
    end

    it "splits the tags by spaces as well as commas" do
      @post.tags_string = "ruby rails css"
      @post.create_tags_from_tag_string

      expect(post_tag_titles).to match_array ["ruby", "rails", "css"]
    end

    it "generates a unique list of tags" do
      @post.tags_string = "ruby, rails, ruby"
      @post.create_tags_from_tag_string

      expect(post_tag_titles).to match_array ["ruby", "rails"]
    end

    it "completely replaces the list of tags upon update" do
      @post.tags = [FactoryGirl.create(:tag, title: 'ruby')]
      @post.save!
      @post.reload

      expect(post_tag_titles).to match_array ["ruby"]

      @post.tags_string = "rails, css"
      @post.create_tags_from_tag_string

      expect(post_tag_titles).to match_array ["rails", "css"]
    end

    it "checks if a tag title already exists in other posts" do
      tag = FactoryGirl.create :tag, title: 'another_tag'
      @post2 = FactoryGirl.create :internal_post, tags: [tag]
      @post3 = FactoryGirl.create :external_post, tags: [tag]

      @post.tags_string = "ruby, great"
      @post.create_tags_from_tag_string

      @post2.tags_string = "rails, great"
      @post2.create_tags_from_tag_string

      all_tag_titles = Tag.all.map(&:title)
      expect(all_tag_titles).to match_array [
        "question",
        "ruby",
        "rails",
        "great",
        "another_tag"]
    end
  end

  describe "#add_vote" do
    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:internal_post)
    end

    it "creates a vote by the given user" do
      @post.add_vote(@user)
      expect(@post.votes.count).to eq 1
    end

    it "doesn't create a second vote for a given user" do
      @post.add_vote(@user)
      @post.add_vote(@user)

      expect(@post.votes.count).to eq 1
    end
  end

  describe "#has_voted?" do
    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:internal_post)
    end

    it "returns true if the given user has already voted on the post" do
      expect(@post.has_voted?(@user)).to be_falsey
      @post.add_vote(@user)
      expect(@post.has_voted?(@user)).to be_truthy
    end
  end
end
