class AddTimeRangeToCourses < ActiveRecord::Migration
  def change
	rename_column :courses, :duration, :time_start
	add_column :courses, :time_end, :string
  end
end
