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
    url = Rails.application.routes.url_helpers.tutorial_url(self)
    $twitter_client.update("New Tutorial: #{title} #{url}")
  end
end
