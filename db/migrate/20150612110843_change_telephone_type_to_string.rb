class ChangeTelephoneTypeToString < ActiveRecord::Migration
  def change
  	change_column :users, :telephone, :string
  end
end
