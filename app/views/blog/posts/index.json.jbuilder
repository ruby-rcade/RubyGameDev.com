json.array!(@blog_posts) do |blog_post|
  json.extract! blog_post, :title, :body_markdown, :body_html, :draft, :published_on, :user_id
  json.url blog_post_url(blog_post, format: :json)
end
