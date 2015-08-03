class CommentsMailer < ApplicationMailer
  default from: "from@example.com"
  
  def notification_new_comment(user_id)

    @user = User.find user_id
    @url  = 'http://example.com/login'

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
