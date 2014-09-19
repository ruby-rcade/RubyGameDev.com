class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, as: :parent

  validates_presence_of :user, :title
end
