class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, as: :parent

  validates_presence_of :user, :title

  before_save do
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    self.body_html = parser.render(body_markdown)
  end
end
