class Course < ActiveRecord::Base
	mount_uploader :course_pdf, CoursePdfUploader
	belongs_to :teacher
	belongs_to :student
	has_many :orders
	has_many :lessons
	has_many :trials

	validates :language, :level, :price, :time_start, :time_end, :course_type, :course_start,
			  :course_end, :course_pdf, :time_zone, :lesson_per_week, :adobe_connect, presence: true
	validates :description, length: {maximum: 400}
	validates :price, numericality: { greater_than: 2 }

end
