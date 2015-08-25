class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, polymorphic: true

  validates_presence_of :user
  validates_presence_of :parent

  after_create :send_new_comment_notification

  def send_new_comment_notification
    CommentMailer.send_notification_email(self.id).deliver!
  end
end
