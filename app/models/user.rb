class User < ActiveRecord::Base
  def username
    username = read_attribute(:username)
    return username unless username.blank?
    "Guest#{id}"
  end
end
