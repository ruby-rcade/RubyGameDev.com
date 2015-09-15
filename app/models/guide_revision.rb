class GuideRevision < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide

  validates :user, :title, :body_markdown, presence: :true
end
