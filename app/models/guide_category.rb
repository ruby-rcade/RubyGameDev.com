class GuideCategory < ActiveRecord::Base
  has_many :guides
  validates :name, presence: true

  def add_category_index
    @guide = Guide.new
  end
end
