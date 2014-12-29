json.question do |json|
  json.text @answer.question.question
  json.values(answer.scale)
end

