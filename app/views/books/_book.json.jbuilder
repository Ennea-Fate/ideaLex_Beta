json.extract! book, :id, :text, :name, :publ_date, :created_at, :updated_at
json.url book_url(book, format: :json)
