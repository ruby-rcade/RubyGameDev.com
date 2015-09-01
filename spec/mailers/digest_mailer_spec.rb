require "rails_helper"

describe DigestMailer do

  describe "#daily_digest" do

    let(:user) { FactoryGirl.create(:user) }
    let(:history) { DigestHistory.create_new!("Daily") }
    let(:mail) { DigestMailer.daily_digest(history, user.id) }

    it "renders the subject" do
      expect(mail.subject).to eql('RubyGameDev.com Daily Digest')
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["no-reply@rubygamedev.com"])
    end  

    xit "render the body email" do
      expect(comment.body).to match(
        "hello this is the body of comment")
    end
  end

end