class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, presence: true

  has_many :votes
  has_many :voted_users, through: :votes, source: :user, class_name: 'User'

  scope :internal_post, -> { where(type: "InternalPost") }
  scope :external_post, -> { where(type: "ExternalPost") }

  def types
    %w(ExternalPost InternalPost)
  end

  def tags_string
    tags.map(&:title).join(", ")
  end

  def tags_string=(value)
    @tags_list = []
    value.strip.downcase.split(/, *| +/).each do |tag|
      @tags_list.push(tag.strip)
    end
    @tags_list = @tags_list.uniq
  end
end
