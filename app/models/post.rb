class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, presence: true
  after_create :question_tag

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

  def external_post?
    self.type == "ExternalPost"
  end

  def internal_post?
    self.type == "InternalPost"
  end

  def question_tag
    if external_post?
      related_tag = Tag.find_or_create_by(title: "question")
      self.tags << related_tag
    end
  end

end
