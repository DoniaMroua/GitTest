json.array!(@authors) do |author|
  json.extract! author, :id, :firstname, :secondname, :age
  json.url author_url(author, format: :json)
end
