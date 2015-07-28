class ExternalPost < Post
	self.table_name = 'external_posts'

	validates_uniqueness_of :external_id

	private

	def child?
	  true
	end
end