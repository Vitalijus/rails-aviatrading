class AddCourseStartAndCourseEndAndRegistrationUntilToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_start, :datetime
    add_column :courses, :course_end, :datetime
    add_column :courses, :registration_until, :datetime
  end
end
