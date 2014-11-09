json.array!(@trials_questions) do |trials_question|
  json.extract! trials_question, :id, :id, :question_id, :trial_id
  json.url trials_question_url(trials_question, format: :json)
end
