class DigestMailer < ApplicationMailer

  def daily_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id

    attachments.inline['header_daily.png'] =
      File.read("#{Rails.root}/app/assets/images/header_daily.png")
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
      File.read("#{Rails.root}/app/assets/images/header_weekly.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: 'RubyGameDev.com Weekly Digest')
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
      File.read("#{Rails.root}/app/assets/images/header_monthly.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: 'RubyGameDev.com Monthly Digest')
  end

end
