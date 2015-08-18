require "rails_helper"
describe PostLocationHelper, type: 'helper' do
  describe "#link_to_post" do
    let(:external_post) { FactoryGirl.create(:external_post) }
    let(:internal_post) { FactoryGirl.create(:internal_post) }

    it "returns gamedev url" do
      expect(helper.link_to_post(external_post)
      ).to match("http://gamedev.stackexchange.com/")
    end

    it "returns posts url" do
      expect(
        helper.link_to_post(internal_post)).to match(post_path(internal_post))
    end
  end
end
