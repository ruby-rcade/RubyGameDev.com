class Tutorial < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title
  after_create :notify_twitter

  # TODO: implement voting
  def score
    0
  end

  # TODO: move this to background job
  def notify_twitter
    $twitter_client.update(tweet_content)
  end

  def tweet_content
    intro = 'New Tutorial: '
    url = Rails.application.routes.url_helpers.tutorial_short_link_url(self, host: 'rbga.me')
    url = " #{url}"
    max_title_length = 140 - intro.length - url.length
    intro + title[0...max_title_length] + url
  end
end
