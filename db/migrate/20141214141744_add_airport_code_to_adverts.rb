class AddAirportCodeToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :airport_code, :string
  end
end
