json.array!(@answers) do |answer|
  json.extract! answer, :id, :id, :question_id, :user_id, :due_date, :answered_at, :value, :value_text
  json.url answer_url(answer, format: :json)
end
