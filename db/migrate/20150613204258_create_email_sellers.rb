class CreateEmailSellers < ActiveRecord::Migration
  def change
    create_table :email_sellers do |t|
      t.string :email
      t.string :name
      t.string :phone
      t.string :company
      t.string :country
      t.text :message
      t.integer :advert_id

      t.timestamps
    end
  end
end
