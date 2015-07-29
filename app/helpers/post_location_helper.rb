module PostLocationHelper
	def link_to_post(post)
		if post.type == 'ExternalPost' 
			link_to(post.title, post.source_url, target: '_blank') 
		else
			link_to(post.title, post_path(post))
		end
	end

end