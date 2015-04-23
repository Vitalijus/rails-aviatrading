class AddActiveAccountToUsers < ActiveRecord::Migration
  def change
	add_column :users, :active_account, :boolean, default: false
  end
end
