class RemoveSomeColumns < ActiveRecord::Migration
  def change
  		remove_column :adverts, :title
  		remove_column :adverts, :advert_image
  end
end
