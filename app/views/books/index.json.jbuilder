json.array!(@books) do |book|
  json.extract! book, :title, :author, :isbn, :publisher, :description, :string
  json.url book_url(book, format: :json)
end
