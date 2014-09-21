json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :description, :course_id, :title
  json.url lesson_url(lesson, format: :json)
end
