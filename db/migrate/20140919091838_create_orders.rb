class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name_on_card
      t.string :stripe_customer_token
      t.integer :course_id

      t.timestamps
    end
  end
end
