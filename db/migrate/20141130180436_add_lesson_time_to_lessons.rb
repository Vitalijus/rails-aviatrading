class AddLessonTimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_time, :datetime
  end
end
