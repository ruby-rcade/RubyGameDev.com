class DigestMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.digest_mailer.daily_digest.subject

  def daily_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    #@new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
  end

  def w_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    #@new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
  end

  def m_digest(history, user_id)
    # @discussions = history.discussions
    # @tutorials = history.tutorials
    # @libraries = history.libraries
    #@new_users_count = User.count - history.users_count
    # @comment = Comment.find comment_id
    @user = User.find user_id
    mail to: @user.email, subject: 'RubyGameDev.com Daily Digest'
    binding.pry
  end

end
