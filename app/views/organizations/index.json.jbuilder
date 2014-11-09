json.array!(@organizations) do |organization|
  json.extract! organization, :id, :id, :address_id
  json.url organization_url(organization, format: :json)
end
