class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, polymorphic: true

  validates_presence_of :user
  validates_presence_of :parent

  after_create :notification_mailer
  def notification_mailer
    CommentMailer.notification_new_comment(self.id).deliver!
  end
end
