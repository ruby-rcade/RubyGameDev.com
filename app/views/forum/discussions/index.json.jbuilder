json.array!(@forum_discussions) do |forum_discussion|
  json.extract! forum_discussion, :title, :body, :user_id, :topic_id
  json.url forum_discussion_url(forum_discussion, format: :json)
end
