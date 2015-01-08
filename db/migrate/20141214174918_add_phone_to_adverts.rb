class AddPhoneToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :phone, :string
  end
end
