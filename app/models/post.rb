class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, as: :parent

  validates_presence_of :user, :title

  before_save do
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    self.body_html = parser.render(body_markdown)
  end

  after_create :notify_twitter
  # TODO: move this to background job
  def notify_twitter
    if not Rails.env.development? and not Rails.env.test?
      $twitter_client.update(tweet_content)
    end
  end

  def tweet_content
    url = Rails.application.routes.url_helpers.post_short_link_url(self, host: 'rbga.me')
    url = " #{url}"
    max_title_length = 140 - url.length
    title[0...max_title_length] + url
  end

  def tags_description=(value)
    @tags_list = []
    value.downcase.split(",").each do |tag|
      @tags_list.push(tag.strip)
    end
  end

  def tags_list
    @tags_list.uniq
  end

  def create_tag(title)
    tags.create!({title: title, user_id: self.user_id})
  end

  def create_tags_from_description
  end
end
