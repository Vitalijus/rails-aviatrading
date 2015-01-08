class AddEngineTypeAndNumberOfEnginesAndEngineMakeAndEngineModelAndEngineHoursAndEngineNotesAndTboAndEnginePowerAndNumberOfPropellersAndPropellerMakeAndPropellerModelAndPropellerHoursToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :engine_type, :string
    add_column :adverts, :number_of_engines, :integer
    add_column :adverts, :engine_make, :string
    add_column :adverts, :engine_model, :string
    add_column :adverts, :engine_hours, :integer
    add_column :adverts, :engine_notes, :text
    add_column :adverts, :tbo, :integer
    add_column :adverts, :engine_power, :string
    add_column :adverts, :number_of_propellers, :integer
    add_column :adverts, :propeller_make, :string
    add_column :adverts, :propeller_model, :string
    add_column :adverts, :propeller_hours, :integer
  end
end
