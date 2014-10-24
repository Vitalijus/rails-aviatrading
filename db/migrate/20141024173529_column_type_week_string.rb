class ColumnTypeWeekString < ActiveRecord::Migration
  def change
	change_column :courses, :lesson_per_week, :string
  end
end
