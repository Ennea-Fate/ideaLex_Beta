json.extract! author, :id, :f_name, :s_name, :l_name, :created_at, :updated_at
json.url author_url(author, format: :json)
