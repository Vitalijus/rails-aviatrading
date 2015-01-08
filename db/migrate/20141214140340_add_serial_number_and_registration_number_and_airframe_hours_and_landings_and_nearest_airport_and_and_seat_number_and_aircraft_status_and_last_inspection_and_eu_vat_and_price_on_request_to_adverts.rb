class AddSerialNumberAndRegistrationNumberAndAirframeHoursAndLandingsAndNearestAirportAndAndSeatNumberAndAircraftStatusAndLastInspectionAndEuVatAndPriceOnRequestToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :serial_number, :string
    add_column :adverts, :registration_number, :string
    add_column :adverts, :aircraft_hours, :integer
    add_column :adverts, :landings, :integer
    add_column :adverts, :nearest_airport, :string
    add_column :adverts, :aircraft_status, :string
    add_column :adverts, :last_inspection, :datetime
    add_column :adverts, :eu_vat, :boolean
    add_column :adverts, :price_on_request, :boolean
  end
end
