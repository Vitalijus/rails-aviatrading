class ChangeTelephoneTypeToStringB < ActiveRecord::Migration
  def change
  	remove_column :users, :telephone
  end
end
