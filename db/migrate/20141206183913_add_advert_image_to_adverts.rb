class AddAdvertImageToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :advert_image, :string
  end
end
