json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :url, :title, :body_markdown, :body_html, :draft, :published_on, :user_id
  json.url tutorial_url(tutorial, format: :json)
end
