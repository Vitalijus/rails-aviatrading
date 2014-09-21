class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :description
      t.integer :course_id
      t.string :title

      t.timestamps
    end
  end
end
