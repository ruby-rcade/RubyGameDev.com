class DigestMailer < ApplicationMailer
  default template_path: 'digest_mailer'
  default template_name: 'digest_mailer'

  def digest_mailer(history, user_id)
    @user = User.find user_id
    @posts = history.posts
    @history = history
    attachments.inline["header_#{history.frequency}.png"] =
      File.read("#{Rails.root}/app/assets/images/header_#{history.frequency}.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: "RubyGameDev.com #{history.frequency} digest")
  end
end