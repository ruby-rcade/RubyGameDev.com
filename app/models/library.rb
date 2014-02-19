class Library < ActiveRecord::Base
  belongs_to :category, class_name: 'LibraryCategory', foreign_key: "category_id"
  validates_presence_of :category

  after_create :notify_twitter

  # TODO: move this to background job
  def notify_twitter
    url = Rails.application.routes.url_helpers.library_url(self)
    $twitter_client.update("New Library: #{title} #{url}")
  end
end
