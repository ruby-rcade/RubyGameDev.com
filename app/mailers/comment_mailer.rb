class CommentMailer < ApplicationMailer

  def send_notification_email(comment_id)
    @comment = Comment.find comment_id
    @user = User.find @comment.parent.user_id
    @parent_id = @comment.parent_id
    @post = InternalPost.find @parent_id
    @url = "https://www.rubygamedev.com/posts/#{@parent_id}"

    attachments.inline['reply-button.png'] =
      File.read("#{Rails.root}/app/assets/images/reply-button.png")
    attachments.inline['banner-header.png'] =
      File.read("#{Rails.root}/app/assets/images/banner-header.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: "Notification comment")
  end
end
