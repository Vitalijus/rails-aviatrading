class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :advert_id
      t.string :public_token
      t.string :image

      t.timestamps
    end
  end
end
