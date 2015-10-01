class DigestMailer < ApplicationMailer
  default template_path: 'digest_mailer'
  default template_name: 'digest_mailer'

  def digest_mailer(history, user_id)
    @user = User.find user_id
    @posts = posts_to_email(history)
    @history = history
    attachments.inline["header_#{history.frequency}.png"] =
      File.read("#{Rails.root}/app/assets/images/header_#{history.frequency}.png")
    attachments.inline['footer.png'] =
      File.read("#{Rails.root}/app/assets/images/footer.png")
    mail(to: @user.email, subject: "RubyGameDev.com #{history.frequency} digest")
  end

  private

  def posts_to_email(history)
    return history.daily_posts if history.frequency == 'daily'
    return history.weekly_posts if history.frequency == 'weekly'
    history.monthly_posts
  end
end
