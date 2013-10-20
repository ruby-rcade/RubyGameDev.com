class Blog::Post < ActiveRecord::Base
  belongs_to :user
end
