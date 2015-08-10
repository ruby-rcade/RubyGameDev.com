require "rails_helper"

describe Comment do
  let!(:comment) { FactoryGirl.create(:comment) }
  it "sends an email" do
    expect { comment.notification_mailer 
      }.to change { ActionMailer::Base.deliveries.count }.by(1) 
  end
end