require "rails_helper"

describe DigestMailer do

  describe "#daily_digest" do

    let(:user) { FactoryGirl.create(:user) }
    let(:history) { FactoryGirl.create(:digest_history, frequency: "daily") }
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
  end

  describe "#weekly_digest" do

    let(:user) { FactoryGirl.create(:user) }
    let(:history) { FactoryGirl.create(:digest_history, frequency: "weekly") }
    let(:mail) { DigestMailer.weekly_digest(history, user.id) }

    it "renders the subject" do
      expect(mail.subject).to eql('RubyGameDev.com Weekly Digest')
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["no-reply@rubygamedev.com"])
    end
  end

  describe "#monthly_digest" do

    let(:user) { FactoryGirl.create(:user) }
    let(:history) { FactoryGirl.create(:digest_history, frequency: "monthly") }
    let(:mail) { DigestMailer.monthly_digest(history, user.id) }

    it "renders the subject" do
      expect(mail.subject).to eql('RubyGameDev.com Monthly Digest')
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["no-reply@rubygamedev.com"])
    end
  end
end
