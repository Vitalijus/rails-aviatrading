class ChangeColumnDafault < ActiveRecord::Migration
  def change
  		rename_column :adverts, :show_record, :show_advert
  end
end
