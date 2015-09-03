class AddMainImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :main_image, :boolean
  end
end
