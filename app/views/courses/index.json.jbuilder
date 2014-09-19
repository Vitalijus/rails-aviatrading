json.array!(@courses) do |course|
  json.extract! course, :id, :title, :teacher_name
  json.url course_url(course, format: :json)
end
