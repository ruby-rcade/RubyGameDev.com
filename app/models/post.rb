class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, presence: true

  scope :internal_post, -> { where(type: "InternalPost") }
  scope :external_post, -> { where(type: "ExternalPost") }
  has_many :votes
  has_many :voted_users, through: :votes, source: :user, class_name: 'User'

  validates_presence_of :user, :title, :body_markdown

  def types
    %w(ExternalPost InternalPost)
  before_save do
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    self.body_html = parser.render(body_markdown)
  end

  after_create :notify_twitter
  # TODO: move this to background job
  def notify_twitter
    if Rails.env.production?
      $twitter_client.update(tweet_content)
    end
  end

  def tweet_content
    url = Rails.application.routes.url_helpers.post_short_link_url(self, host: 'rbga.me')
    url = " #{url}"
    max_title_length = 140 - url.length
    title[0...max_title_length] + url
  end

  def add_vote(user)
    Vote.find_or_create_by!(post_id: id, user_id: user.id)
  end

  def has_voted?(user)
    Vote.exists?(post_id: id, user_id: user.id)
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
