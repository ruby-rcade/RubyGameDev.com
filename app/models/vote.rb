class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, :post, presence: true
  validates :user_id, uniqueness: {
    scope: :post_id,
    message: "has already voted once on this Post"
  }
end
