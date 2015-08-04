class Vote < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :posts

  validates_presence_of :user
end
