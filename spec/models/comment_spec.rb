require "rails_helper"

describe Comment do
  let!(:comment) { FactoryGirl.create(:comment) }
  it "sends an email" do
    expect { comment.send_new_comment_notification
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
