class CourseWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(course_id)
  	course = Course.find(course_id)
    CourseMailer.course_expiration(course).deliver
  end
end