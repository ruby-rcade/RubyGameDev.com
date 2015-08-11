class DigestMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.digest_mailer.daily_digest.subject

  def daily_digest(history, user)
    @discussions = history.discussions
    @tutorials = history.tutorials
    @libraries = history.libraries
    @new_users_count = User.count - history.users_count
    @user = user
    mail to: user.email, subject: 'RubyGameDev.com Daily Digest'
  end
end
