json.array!(@library_categories) do |library_category|
  json.extract! library_category, :title
  json.url library_category_url(library_category, format: :json)
end
