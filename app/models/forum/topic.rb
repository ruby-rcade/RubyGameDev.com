class Forum::Topic < ActiveRecord::Base
  has_many :discussions
end
