json.array!(@authors) do |author|
  json.extract! author, :name, :details
  json.url author_url(author, format: :json)
end