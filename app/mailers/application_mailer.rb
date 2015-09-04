class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]
  default template_path: 'digest_mailer'
  default template_name: 'digest_mailer'
end
