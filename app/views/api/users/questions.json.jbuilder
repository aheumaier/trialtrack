json.array!(@answers) do |answer|
    json.question answer.question.question
    json.values(answer.scale)
end
