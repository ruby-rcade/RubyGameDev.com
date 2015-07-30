class Post < ActiveRecord::Base

  has_and_belongs_to_many :tags
  validates_presence_of :title

  scope :internalpost, -> { where(type: "InternalPost") }
  scope :externalpost, -> { where(type: "ExternalPost") }

  def types
    %w(ExternalPost InternalPost)
  end

end
