class User < ActiveRecord::Base

  def self.create_from_auth_hash(auth_hash)
    create(github_id: auth_hash['uid'], username: auth_hash['info']['nickname'], email: auth_hash['info']['email'])
  end

  def username
    username = read_attribute(:username)
    return username unless username.blank?
    "Guest#{id}"
  end

  def is_admin?
    id == 1
  end

end
