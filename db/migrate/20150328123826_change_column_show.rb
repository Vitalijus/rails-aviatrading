class ChangeColumnShow < ActiveRecord::Migration
  def change
  	change_column :adverts, :show_advert, :boolean, :default => true
  end
end
