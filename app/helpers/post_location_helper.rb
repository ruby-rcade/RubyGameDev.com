module PostLocationHelper
  def link_to_post(post)
    if post.type == "ExternalPost"
      link_to(post.title, post.source_url, target: '_blank')
    else
      link_to(post.title, post_path(post))
    end
  end

  def show_tags(post)
    if post.type == "ExternalPost"
      "<span>question</span>".html_safe
    else
      post.tags.map { |tag| "<span> #{tag.title} </span>" }.join.html_safe
    end
  end
end
