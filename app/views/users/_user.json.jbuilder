json.extract! user, :id, :email, :f_name, :s_name, :role_id_id, :created_at, :updated_at
json.url user_url(user, format: :json)
