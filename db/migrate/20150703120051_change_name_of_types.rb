class ChangeNameOfTypes < ActiveRecord::Migration
  def change
  		change_column :adverts, :price_options,  :string
  end
end
