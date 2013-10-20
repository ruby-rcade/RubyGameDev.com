class Library < ActiveRecord::Base
  belongs_to :category, class_name: 'LibraryCategory', foreign_key: "category_id"
  validates_presence_of :category
end
