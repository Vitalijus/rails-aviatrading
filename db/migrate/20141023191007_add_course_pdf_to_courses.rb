class AddCoursePdfToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_pdf, :string
  end
end
