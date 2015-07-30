class ExternalPost < Post
	validates_uniqueness_of :external_id
	def username
		self.user_display_name
		end
	end
