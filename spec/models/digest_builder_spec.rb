require "rails_helper"

describe DigestBuilder do
  
  describe "#send_daily_email" do
    let(:daily_digest_builder) { DigestBuilder.send_daily_email }
  
    it "send an email" do
      expect(daily_digest_builder).to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe "#send_weekly_email" do


  end

  describe "#send_monthly_email" do

  end

end