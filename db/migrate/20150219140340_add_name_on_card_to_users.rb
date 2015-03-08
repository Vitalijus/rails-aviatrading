class AddNameOnCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_on_card, :string
  end
end
