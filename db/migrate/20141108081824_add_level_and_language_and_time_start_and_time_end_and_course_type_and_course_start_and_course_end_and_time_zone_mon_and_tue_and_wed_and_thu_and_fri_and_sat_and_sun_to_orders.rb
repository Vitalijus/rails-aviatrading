class AddLevelAndLanguageAndTimeStartAndTimeEndAndCourseTypeAndCourseStartAndCourseEndAndTimeZoneMonAndTueAndWedAndThuAndFriAndSatAndSunToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :level, :string
    add_column :orders, :language, :string
    add_column :orders, :time_start, :string
    add_column :orders, :time_end, :string
    add_column :orders, :course_type, :string
    add_column :orders, :course_start, :string
    add_column :orders, :course_end, :string
    add_column :orders, :time_zone, :string
    add_column :orders, :mon, :string
    add_column :orders, :tue, :string
    add_column :orders, :wed, :string
    add_column :orders, :thu, :string
    add_column :orders, :fri, :string
    add_column :orders, :sat, :string
    add_column :orders, :sun, :string
  end
end
