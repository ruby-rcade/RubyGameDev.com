class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, as: :parent

  validates_presence_of :title

  scope :internalpost, -> { where(type: 'InternalPost') }
  scope :externalpost, -> { where(type: 'ExternalPost') }

  def self.types
      %w(ExternalPost InternalPost)
  end

end
