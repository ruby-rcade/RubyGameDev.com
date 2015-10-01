class Guide < InternalPost
  belongs_to :category, class_name: 'GuideCategory', foreign_key: "guide_category_id"
  has_many :guide_revisions

  validates_presence_of :category
end
