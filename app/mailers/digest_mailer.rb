class DigestMailer < ApplicationMailer
  default template_path: 'digest_mailer'
  default template_name: 'digest_mailer'

  def digest_mailer(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @internal_post = InternalPost.all
    @user = User.find user_id
    @history = history
    attachments.inline["header_#{history.frequency}.png"] =
      File.read("#{Rails.root}/app/assets/images/header_#{history.frequency}.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: "RubyGameDev.com #{history.frequency} digest")
  end
end