class DigestMailer < ActionMailer::Base
  default from: "no-reply@rubygamedev.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.digest_mailer.daily_digest.subject
  #
  def daily_digest
    mail to: "misbehavens@gmail.com", subject: 'RubyGameDev.com Daily Digest'
  end
end
