class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :parent
  validates_presence_of :title, :body, :user
  after_create :notify_twitter

  # TODO: move this to background job
  def notify_twitter
    $twitter_client.update(tweet_content)
  end

  def tweet_content
    intro = 'New Discussion: '
    url = Rails.application.routes.url_helpers.discussion_short_link_url(self, host: 'rbga.me')
    url = " #{url}"
    max_title_length = 140 - intro.length - url.length
    intro + title[0...max_title_length] + url
  end
end
