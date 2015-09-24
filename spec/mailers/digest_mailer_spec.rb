require "rails_helper"

describe DigestMailer do
  describe "#digest_mailer" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:external_post, created_at: Date.today) }
    let(:history) { FactoryGirl.create(:digest_history, frequency: user.digest_frequency) }
    let(:mail) { DigestMailer.digest_mailer(history, user.id) }

    it "renders the subject" do
      expect(mail.subject).to eql("RubyGameDev.com #{user.digest_frequency} digest")
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["no-reply@rubygamedev.com"])
    end
  end
end
