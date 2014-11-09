json.array!(@scales_scalevalues) do |scales_scalevalue|
  json.extract! scales_scalevalue, :id, :id, :scalevalues_id, :scale_id
  json.url scales_scalevalue_url(scales_scalevalue, format: :json)
end
