class ExternalPost < Post
  validates :external_id, uniqueness: true

  def username
    self.user_display_name
  end

  def number_of_comments
    0
  end

  def create_question_tag
    related_tag = Tag.find_or_create_by(title: "question")
    tags << related_tag
  end
end
