class AddPaypalEmailToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :paypal_email, :string
  end
end
