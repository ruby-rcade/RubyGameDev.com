class Post < ActiveRecord::Base

  scope :internalpost, -> { where(type: "InternalPost") }
  scope :externalpost, -> { where(type: "ExternalPost") }

  def self.types
  	%w(ExternalPost InternalPost)
  end

end
