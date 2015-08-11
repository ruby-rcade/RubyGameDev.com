class CommentMailer < ApplicationMailer

  def send_notification_email(comment_id)
    @comment = Comment.find comment_id
    @user = User.find @comment.parent.user_id
    @parent_id = @comment.parent_id
    @url = "https://www.rubygamedev.com/internal_posts/#{@parent_id}"

    mail(to: @user.email, subject: "Notification comment")
  end
end
