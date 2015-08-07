require "rails_helper"
describe PostLocationHelper, :type => :helper do
  describe "#link_to_post" do
    it "returns gamedev url" do
      post = FactoryGirl.create(:external_post)
      expect(helper.link_to_post(post)).to match("http://gamedev.stackexchange.com/")
    end

    it "returns posts url" do
      post = FactoryGirl.create(:internal_post)
      expect(helper.link_to_post(post)).to match("/posts/")
    end
  end

  describe "#show_tags" do
    it "return questions tags" do
      post = FactoryGirl.create(:external_post)
      expect(helper.show_tags(post)).to match("question")
    end

    it "return ruby tag" do
      post = FactoryGirl.create(:internal_post)
      expect(helper.show_tags(post)).to match("example")
    end
  end
end
