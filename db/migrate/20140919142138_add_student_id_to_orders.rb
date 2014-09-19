class AddStudentIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :student_id, :integer
  end
end
