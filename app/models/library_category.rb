class LibraryCategory < ActiveRecord::Base
  has_many :libraries, foreign_key: "category_id"
end
