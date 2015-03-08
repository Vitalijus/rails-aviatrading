class RemoveFromOrders < ActiveRecord::Migration
  def change
	remove_column :orders, :course_id
	remove_column :orders, :student_id
	remove_column :orders, :level
	remove_column :orders, :language
	remove_column :orders, :time_start
	remove_column :orders, :time_end
	remove_column :orders, :course_type
	remove_column :orders, :course_start
	remove_column :orders, :course_end
	remove_column :orders, :time_zone
	remove_column :orders, :mon
	remove_column :orders, :tue
	remove_column :orders, :wed
	remove_column :orders, :thu
	remove_column :orders, :fri
	remove_column :orders, :sat
	remove_column :orders, :sun
  end
end
