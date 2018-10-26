class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, dependent: :destroy
  has_many :posts
  has_many :guide_revisions
  has_many :votes
  has_many :voted_posts, through: :votes, source: :user, class_name: 'User'

  validates_presence_of :username # for display name
  validates_uniqueness_of :email

  before_create :create_default_subscription

  scope :subscriber_daily_digest, -> { where(digest_subscriber: true, digest_frequency: "daily") }
  scope :subscriber_weekly_digest, -> { where(digest_subscriber: true, digest_frequency: "weekly") }
  scope :subscriber_monthly_digest, -> { where(digest_subscriber: true, digest_frequency: "monthly") }

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = find_or_create_by(email: auth_hash['info']['email']) do |u|
      u.username = auth_hash['info']['name']
      u.password = SecureRandom.hex(24) # generate a 24 character random password
    end
    authentication.update_attributes(user: user)
    user
  end

  def admin?
    id == 1 || email == 'email@andrewhavens.com' # Andrew Havens
  end

  def create_default_subscription
    self.digest_subscriber = true
    self.digest_frequency = "daily"
  end
end
