class RemoveTitleAndTeacherNameFromCourses < ActiveRecord::Migration
  def change
	remove_column :courses, :title
	remove_column :courses, :teacher_name
  end
end
