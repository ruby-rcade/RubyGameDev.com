class ExternalPost < Post
	self.table_name = 'external_posts'

	private

	def child?
	  true
	end
end