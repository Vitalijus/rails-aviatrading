class AddTermsConditionsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :terms_conditions, :string
  end
end
