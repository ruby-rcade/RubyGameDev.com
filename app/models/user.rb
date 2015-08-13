class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, dependent: :destroy

  has_many :votes
  has_many :voted_posts, through: :votes, source: :user, class_name: 'User'

  validates_presence_of :username # for display name
  validates_uniqueness_of :email

  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      u.username = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.hex(24) # generate a 24 character random password
      u.authentications << authentication
    end
  end

  def admin?
    id == 1 # Andrew Havens
  end

end
