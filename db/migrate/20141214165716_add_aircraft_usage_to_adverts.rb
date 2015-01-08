class AddAircraftUsageToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :aircraft_usage, :string
  end
end
