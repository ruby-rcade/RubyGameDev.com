json.array!(@discussions) do |discussion|
  json.extract! discussion, :title, :body, :user_id
  json.url discussion_url(discussion, format: :json)
end
