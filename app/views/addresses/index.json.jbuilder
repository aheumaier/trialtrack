json.array!(@addresses) do |address|
  json.extract! address, :id, :id
  json.url address_url(address, format: :json)
end
