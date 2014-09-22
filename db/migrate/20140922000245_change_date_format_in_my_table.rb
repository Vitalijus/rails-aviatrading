class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
	change_column :courses, :course_start, :date
	change_column :courses, :course_end, :date
	change_column :courses, :registration_until, :date
  end
end
