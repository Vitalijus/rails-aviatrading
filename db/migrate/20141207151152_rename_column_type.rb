class RenameColumnType < ActiveRecord::Migration
  def change
	rename_column :adverts, :type, :aircraft_type
  end
end
