class AddCourseIdToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :course_id, :integer
  end
end
