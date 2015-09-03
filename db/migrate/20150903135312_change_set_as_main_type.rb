class ChangeSetAsMainType < ActiveRecord::Migration
  def change
  		remove_column :photos, :set_as_main
  end
end
