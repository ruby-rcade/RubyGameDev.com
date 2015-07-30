class ExternalPost < Post
  validates_uniqueness_of :external_id

  def username
		user_display_name
	end

end
