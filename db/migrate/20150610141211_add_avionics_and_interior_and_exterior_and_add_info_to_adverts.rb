class AddAvionicsAndInteriorAndExteriorAndAddInfoToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :avionics, :text
    add_column :adverts, :interior, :text
    add_column :adverts, :exterior, :text
    add_column :adverts, :add_info, :text
  end
end
