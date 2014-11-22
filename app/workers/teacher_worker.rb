class TeacherWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(teacher_id)
  	teacher = Teacher.find(teacher_id)
    TeacherMailer.status(teacher).deliver
  end
end