json.array!(@questions) do |question|
  json.extract! question, :id, :id, :question_type_id, :question, :interval, :scale_id
  json.url question_url(question, format: :json)
end
