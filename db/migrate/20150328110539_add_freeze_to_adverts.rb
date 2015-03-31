class AddFreezeToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :freeze, :boolean, :default => false
  end
end
