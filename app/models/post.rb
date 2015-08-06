class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates_presence_of :title

  scope :internal_post, -> { where(type: "InternalPost") }
  scope :external_post, -> { where(type: "ExternalPost") }

  def types
    %w(ExternalPost InternalPost)
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

  def create_tags_from_tag_string
    tags.clear
    @tags_list.each do |tag_title|
      existing_tag = Tag.find_by(title: tag_title)

      if existing_tag
        tags << existing_tag
      else
        tags.create!(title: tag_title, user_id: user_id)
      end
    end
  end
end
