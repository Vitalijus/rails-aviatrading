class RenameVatToValueAddedTax < ActiveRecord::Migration
  def change
  	rename_column :adverts, :VAT, :value_added_tax
  end
end
