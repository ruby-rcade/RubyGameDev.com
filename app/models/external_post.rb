class ExternalPost < Post
  validates :external_id, uniqueness: true

  def username
		user_display_name
	end

end
