class CommentMailer < ApplicationMailer
  default from: "powercodegirls@gmail.com"
  
  def notification_new_comment(user_id, parent_id)

    @user = User.find user_id
    @parent_id = parent_id
    @url  = "https://www.rubygamedev.com/internal_posts/#{@parent_id}"

    mail(to: @user.email, subject: 'New comment from your post')
  end
end
