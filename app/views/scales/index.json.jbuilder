json.array!(@scales) do |scale|
  json.extract! scale, :id, :id, :scale_start, :scale_end, :value_no_answer
  json.url scale_url(scale, format: :json)
end
