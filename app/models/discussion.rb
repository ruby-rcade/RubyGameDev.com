class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :parent

  validates_presence_of :title, :body, :user

end
