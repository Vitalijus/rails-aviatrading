class RemovePaidNameOnCard < ActiveRecord::Migration
  def change
	remove_column :users, :paid
	remove_column :users, :name_on_card
  end
end
