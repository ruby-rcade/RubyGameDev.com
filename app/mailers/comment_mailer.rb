class CommentMailer < ApplicationMailer
  default from: "no-reply@rubygamedev.com"
  # ENV["MAIL_NO_REPLY"]
  def notification_new_comment(comment_id)
    @comment = Comment.find comment_id
    @user = User.find @comment.parent.user_id
    @parent_id = @comment.parent_id
    @url = "https://www.rubygamedev.com/internal_posts/#{@parent_id}"

    mail(to: @user.email, subject: "Notification comment")
  end
end
