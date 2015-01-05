class Authentication < ActiveRecord::Base

  belongs_to :user

  def self.find_or_create_from_auth_hash(auth_hash)
    find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || create_from_auth_hash(auth_hash)
  end

  def self.create_from_auth_hash(auth_hash)
    create! do |auth|
      auth.provider = auth_hash['provider']
      auth.uid = auth_hash['uid']
      auth.token = auth_hash['credentials']['token']
    end
  end

  def update_token(auth_hash)
    self.token = auth_hash['credentials']['token']
    save
  end

end
