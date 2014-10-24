class AddLessonPerWeekAndTimeZoneToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :lesson_per_week, :integer
    add_column :courses, :time_zone, :string
  end
end
