json.trials @trials do |trial|
  json.name    trial.name
  json.summary trial.summary
  json.questions trial.questions ? trial.questions : nil
end