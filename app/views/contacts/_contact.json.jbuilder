json.extract! contact, :id, :firstname, :lastname, :phone, :remarks, :user_id, :suburb_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
