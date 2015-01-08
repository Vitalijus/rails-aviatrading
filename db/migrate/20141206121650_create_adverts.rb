class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
