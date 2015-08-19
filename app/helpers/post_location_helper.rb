module PostLocationHelper
  def link_to_post(post)
    if post.external_post?
      link_to(post.title, post.source_url, target: '_blank')
    else
      link_to(post.title, post_path(post))
    end
  end

  def show_votes(post)
    if post.has_voted?(current_user)
      ("<span class='fa fa-chevron-up'></span><br/>" +
      "<span> #{post.votes.count} </span><br/>" +
      "<span class='small'>votes</span>").html_safe
    else
      link_to vote_post_path(post), method: :put do
        ("<span class='fa fa-chevron-up'></span><br/>" +
        "<span> #{post.votes.count} </span><br/>" +
        "<span class='small'>votes</span>").html_safe
      end
    end
  end
end
