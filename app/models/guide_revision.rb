class GuideRevision < Guide
  belongs_to :user
  belongs_to :guide

  validates :user, :guide, presense: :true
end
