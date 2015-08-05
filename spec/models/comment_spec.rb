require "rails_helper"

describe Comment do
  subject { FactoryGirl.build(:comment) }
  it "sends an email" do
    expect { subject.notification_mailer }.to change {
      ActionMailer::Base.deliveries.count }.by(1) 
  end
end
