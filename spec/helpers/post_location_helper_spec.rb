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
      expect(helper.link_to_post(internal_post)).to match("/posts/")
    end
  end

  describe "#show_votes" do
    let(:internal_post) { FactoryGirl.create(:internal_post) }

    # it "returns 1 if current user has voted" do
    #   expect(helper.show_votes(internal_post)
    #   ).to match();
    # end

    # it "returns 1 if current user has voted" do
    #   expect(helper.show_votes(internal_post)
    #   ).to match();
    # end
  end
end
