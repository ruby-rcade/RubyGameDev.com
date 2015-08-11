require "rails_helper"

describe CommentMailer do
  describe "#send_new_comment_notification" do
    let!(:comment) { FactoryGirl.create(:comment) }
    let(:mail) { CommentMailer.send_notification_email(comment.id) }

    it "renders the subject" do
      expect(mail.subject).to eql('Notification comment')
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([comment.parent.user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["no-reply@rubygamedev.com"])
    end

    it "assigns @name" do
      expect(mail.body.encoded).to match(comment.parent.user.username)
    end

    it "assigns @confirmation_url" do
      expect(mail.body.encoded).to match(
        "https://www.rubygamedev.com/internal_posts/#{comment.parent_id}")
    end

    it "render the body email" do
      expect(comment.body).to match(
        "hello this is the body of comment")
    end
  end
end
