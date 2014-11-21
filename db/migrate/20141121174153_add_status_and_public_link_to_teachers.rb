class AddStatusAndPublicLinkToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :status, :string
    add_column :teachers, :public_link, :string
  end
end
