json.question do |json|
  json.text @answer.question.question
  json.values(@values)
end

