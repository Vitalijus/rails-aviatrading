class Course < ActiveRecord::Base
	mount_uploader :course_pdf, CoursePdfUploader
	belongs_to :teacher
	has_many :orders
	has_many :lessons
	has_many :trials

	validates :language, :level, :price, :duration, :course_type, :course_start,
			  :course_end, :course_pdf, :time_zone, :lesson_per_week, presence: true
	validates :description, length: {maximum: 300}

end
