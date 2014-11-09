json.array!(@trials_users) do |trials_user|
  json.extract! trials_user, :id, :id, :user_id, :trial_id, :start_date, :end_date
  json.url trials_user_url(trials_user, format: :json)
end
