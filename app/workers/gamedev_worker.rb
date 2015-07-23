class GamedevWorker
	include Sidekiq::Worker

	def perform	
		response = RubyStackoverflow.questions({order: 'asc', filter: 'withbody'})
		response.data.each do | question| 
		  ExternalPost.create(title: question.title, 
		  				      user_display_name: question.owner[:display_name],
		  					  body_html: question.body, 
		  					  source_url: question.link)
	    end
	end
end