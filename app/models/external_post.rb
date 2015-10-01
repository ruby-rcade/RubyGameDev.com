class ExternalPost < Post
  validates :external_id, uniqueness: true
  alias_attribute :body, :body_html

  def username
    self.user_display_name
  end

  def number_of_comments
    0
  end
end
