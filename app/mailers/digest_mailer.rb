class DigestMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]

  def daily_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
  end

  def weekly_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Weekly Digest'
  end

  def monthly_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    # @new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Monthly Digest'
  end

end
