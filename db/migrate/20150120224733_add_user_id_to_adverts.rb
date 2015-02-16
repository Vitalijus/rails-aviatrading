class AddUserIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :used_id, :integer
  end
end
