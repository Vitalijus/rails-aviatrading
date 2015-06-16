class AddEnginePowerUnitToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :engine_power_unit, :string
  end
end
