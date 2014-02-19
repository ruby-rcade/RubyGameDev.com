class User < ActiveRecord::Base

  has_many :tutorials
  has_many :discussions

  def self.create_from_auth_hash(auth_hash)
    create(github_id: auth_hash['uid'], username: auth_hash['info']['nickname'], email: auth_hash['info']['email'])
  end

  def admin?
    id == 1
  end

end
