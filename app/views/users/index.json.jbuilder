json.array!(@users) do |user|
  json.extract! user, :id, :id, :first_name, :last_name, :role_id, :address_id, :organization_id
  json.url user_url(user, format: :json)
end
