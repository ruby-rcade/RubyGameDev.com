class DigestMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]

  def daily_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id

    attachments.inline['header_digest_email.png'] =
      File.read("#{Rails.root}/app/assets/images/header_digest_email.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: 'RubyGameDev.com Daily Digest')
  end

  def weekly_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    # @user = User.find user_id
    # mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
    @user = User.find user_id

    attachments.inline['header_digest_email.png'] =
      File.read("#{Rails.root}/app/assets/images/header_digest_email.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: 'RubyGameDev.com Daily Digest')

  end

  def monthly_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    # @user = User.find user_id
    # mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
    @user = User.find user_id

    attachments.inline['header_digest_email.png'] =
      File.read("#{Rails.root}/app/assets/images/header_digest_email.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: 'RubyGameDev.com Daily Digest')
  end

end
