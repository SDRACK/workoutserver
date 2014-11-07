json.array!(@routines) do |routine|
  json.extract! routine, :id, :move, :bodypart, :reps
  json.url routine_url(routine, format: :json)
end
