class InternalPost < Post
  belongs_to :user
  validates :user, :title, :body_markdown, presence: true
  has_many :comments, as: :parent

  before_save do
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    self.body_html = parser.render(body_markdown)
  end

  def username
    self.user.username
  end

  def number_of_comments
    comments.count
  end
end
