class Guide < InternalPost
  belongs_to :category, class_name: 'GuideCategory', foreign_key: "guide_category_id"
  validates_presence_of :category
end
