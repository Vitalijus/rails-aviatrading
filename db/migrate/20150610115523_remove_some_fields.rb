class RemoveSomeFields < ActiveRecord::Migration
  def change
  		remove_column :adverts, :surname
  		remove_column :adverts, :eu_vat
  		remove_column :adverts, :document
  		remove_column :adverts, :advert_duration
  end
end
