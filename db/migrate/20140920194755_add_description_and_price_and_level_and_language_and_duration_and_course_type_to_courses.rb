class AddDescriptionAndPriceAndLevelAndLanguageAndDurationAndCourseTypeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :description, :text
    add_column :courses, :price, :integer
    add_column :courses, :level, :string
    add_column :courses, :language, :string
    add_column :courses, :duration, :string
    add_column :courses, :course_type, :string
  end
end
