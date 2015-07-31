class ChangeVatToAnotherName < ActiveRecord::Migration
  def change
  		rename_column :adverts, :value_added_tax, :vat
  end
end
