class ChangeNameOfColumns < ActiveRecord::Migration
  def change
  		rename_column :adverts, :aircraft_status, :VAT
  		rename_column :adverts, :price_on_request, :price_options
  end
end
