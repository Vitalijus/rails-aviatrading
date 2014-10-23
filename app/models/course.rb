class Course < ActiveRecord::Base
	mount_uploader :course_pdf, CoursePdfUploader
	belongs_to :teacher
	has_many :orders
	has_many :lessons
	has_many :trials

end
