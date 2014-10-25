class AddNativeLanguageAndIteachAndIspeakAndAgeAndLocationAndTimeZoneAndAboutMeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :native_language, :string
    add_column :teachers, :iteach, :string
    add_column :teachers, :ispeak, :string
    add_column :teachers, :age, :integer
    add_column :teachers, :location, :string
    add_column :teachers, :time_zone, :string
    add_column :teachers, :about_me, :text
  end
end
