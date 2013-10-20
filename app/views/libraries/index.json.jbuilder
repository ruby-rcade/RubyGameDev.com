json.array!(@libraries) do |library|
  json.extract! library, :name, :description, :website_url, :category_id
  json.url library_url(library, format: :json)
end
