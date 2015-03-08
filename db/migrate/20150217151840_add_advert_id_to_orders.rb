class AddAdvertIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :advert_id, :integer
  end
end
