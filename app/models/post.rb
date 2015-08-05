class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, as: :parent

  has_many :votes
  has_many :voted_users, through: :votes, source: :user, class_name: 'User'

  validates_presence_of :user, :title

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

  def vote
    votes.count(conditions: "value = 1")
  end
end
