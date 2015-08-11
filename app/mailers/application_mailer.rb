class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_NOTIFICATION"]
end
