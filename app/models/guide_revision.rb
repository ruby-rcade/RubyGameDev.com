class GuideRevision < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide, foreign_key: "original_guide_id"

  validates :user, :title, :body_markdown, presence: :true
end
