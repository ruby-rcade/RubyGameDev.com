class GamedevWorker
	include Sidekiq::Worker

	def perform
		response = RubyStackoverflow.questions({order: 'asc', filter: 'withbody'})
		response.data.each do | question| 
		  puts "holi #{question.title}"
		  Post.create(title: question.title, body_html: question.body, user_id: question.owner[:user_id])
		  Post.save
		  puts "holi hhh#{question.title}"
	    end
	end
end