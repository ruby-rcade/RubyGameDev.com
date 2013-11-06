class Discussion < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :body, :user

  def comments
    [] # TODO: feature not yet implemented
  end
end
