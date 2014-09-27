class AddNameAndSurnameToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :surname, :string
  end
end
