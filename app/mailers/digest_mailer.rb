class DigestMailer < ActionMailer::Base
  default from: "no-reply@rubygamedev.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.digest_mailer.daily_digest.subject
  #
  def daily_digest(digest, user)
    @digest = digest
    @user = user
    mail to: user.email, subject: 'RubyGameDev.com Daily Digest'
  end
end
