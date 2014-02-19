class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :parent
  validates_presence_of :title, :body, :user
  after_create :notify_twitter

  # TODO: move this to background job
  def notify_twitter
    url = Rails.application.routes.url_helpers.discussion_url(self)
    $twitter_client.update("New Discussion: #{title} #{url}")
  end
end
