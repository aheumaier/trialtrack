json.array!(@scalevalues) do |scalevalue|
  json.extract! scalevalue, :id, :id, :value, :description
  json.url scalevalue_url(scalevalue, format: :json)
end
