require "rails_helper"

describe CommentMailer do
  describe "#notification_new_comment" do
    let!(:comment) { FactoryGirl.build(:comment) }
    let(:mail) { CommentMailer.notification_new_comment
      (comment.parent.user.id, nil)}
    #binding.pry
    it "renders the subject" do
      expect(mail.subject).to eql('New comment from your post')
    end
 
    it "renders the receiver email" do
       expect(mail.to).to eql([comment.parent.user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["powercodegirls@gmail.com"])
    end
 
    it "assigns @name" do
      expect(mail.body.encoded).to match(comment.parent.user.username)
    end
 
    it "assigns @confirmation_url" do
      binding.pry
      expect(mail.body.encoded).to
        match("https://www.rubygamedev.com/internal_posts")
    end
  end
end
