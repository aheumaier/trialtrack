json.array!(@trials) do |trial|
  json.extract! trial, :id, :id, :name, :description, :summary
  json.url trial_url(trial, format: :json)
end
