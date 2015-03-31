class ChangeColumnFreeze < ActiveRecord::Migration
  def change
  	rename_column :adverts, :freeze, :show_record
  end
end
