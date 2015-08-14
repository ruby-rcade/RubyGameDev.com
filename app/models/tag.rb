class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_presence_of :user, :title
end
