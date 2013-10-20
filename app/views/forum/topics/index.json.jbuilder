json.array!(@forum_topics) do |forum_topic|
  json.extract! forum_topic, :title
  json.url forum_topic_url(forum_topic, format: :json)
end
