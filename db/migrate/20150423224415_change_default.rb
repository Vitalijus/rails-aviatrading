class ChangeDefault < ActiveRecord::Migration
  def change
	change_column_default :users, :active_account, true
  end
end
