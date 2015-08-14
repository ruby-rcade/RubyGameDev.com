class ExternalPost < Post
  validates :external_id, uniqueness: true
  after_create :question_tag

  def username
    self.user_display_name
  end

  def number_of_comments
    0
  end

  def question_tag
    tags.create(title: "question")
  end
end
