json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :move, :bodypart, :reps
  json.url exercise_url(exercise, format: :json)
end
