class RenameColumnNameUser < ActiveRecord::Migration
  def change
	rename_column :adverts, :used_id, :user_id
  end
end
