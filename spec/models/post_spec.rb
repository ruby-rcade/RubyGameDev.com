require "rails_helper"

describe Post do
  it { should validate_presence_of :title }
  it { should have_and_belong_to_many :tags }
  let(:post) { FactoryGirl.create :external_post }
  let(:post2) { FactoryGirl.create :external_post }

  it "checks if a tag title question already exists in other posts" do
    post.question_tag
    post2.question_tag
    all_tag_titles = Tag.all.map(&:title)
    expect(all_tag_titles).to match_array ["question"]
  end
end
