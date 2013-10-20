class Tutorial < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user

  def score
    0
  end

end
