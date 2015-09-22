class InternalPost < Post
  belongs_to :user
  validates :user, :body_markdown, presence: true
  has_many :comments, as: :parent
  alias_attribute :body, :body_markdown

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
