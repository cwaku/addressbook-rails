json.extract! user, :id, :firstname, :lastname, :email, :active_status, :del_status, :created_at, :updated_at
json.url user_url(user, format: :json)
