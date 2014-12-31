class Tutorial < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title

  # TODO: implement voting
  def score
    0
  end
end
