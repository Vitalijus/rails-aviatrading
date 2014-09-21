class Course < ActiveRecord::Base
	belongs_to :teacher
	has_many :orders
	has_many :lessons
end
