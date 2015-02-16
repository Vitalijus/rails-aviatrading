class DropManyTables < ActiveRecord::Migration
  def change
  	drop_table :trials
  	drop_table :teachers
  	drop_table :students
  	drop_table :sessions
  	drop_table :courses
  end
end
